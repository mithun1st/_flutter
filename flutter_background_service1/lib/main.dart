import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());

}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  /// OPTIONAL, using custom notification channel id
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
    'MY FOREGROUND SERVICE', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: false,
      isForegroundMode: true,

      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing...',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: false,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );

  //service.startService();
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  //---------------------
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //------------------------------/

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  Timer.periodic(const Duration(seconds: 2), (Timer timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        flutterLocalNotificationsPlugin.show(
          888,
          'COOL SERVICE',
          'Awesome ${DateTime.now()}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'my_foreground',
              'MY FOREGROUND SERVICE',
              icon: '@mipmap/ic_launcher',
              ongoing: true,
            ),
          ),
        );
      }
    }

    /// you can see this log in logcat
    print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
      },
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FlutterBackgroundService service = FlutterBackgroundService();

  //-----------------------------button functions
  void foreGroundMode() {
    service.invoke("setAsBackground");
  }

  void backGroundMode() {
    service.invoke("setAsBackground");
  }

  void checkService() async {
    print(await service.isRunning());
  }

  void startService() async {
    await service.startService();
  }

  void stopServide() async {
    service.invoke("stopService");
  }

  @override
  void initState() {
    initializeService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Service App'),
        ),
        body: Column(
          children: [
            StreamBuilder<Map<String, dynamic>?>(
              stream: FlutterBackgroundService().on('update'),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final data = snapshot.data!;
                DateTime? date = DateTime.tryParse(data["current_date"]);
                return Text(date.toString());
              },
            ),
            ElevatedButton(
              child: const Text("Foreground Mode"),
              onPressed: () => foreGroundMode(),
            ),
            ElevatedButton(
              child: const Text("Background Mode"),
              onPressed: () => backGroundMode(),
            ),
            ElevatedButton(
              child: Text('Check'),
              onPressed: () => checkService(),
            ),
            ElevatedButton(
              child: Text('Start'),
              onPressed: () => startService(),
            ),
            ElevatedButton(
              child: Text('Stop'),
              onPressed: () => stopServide(),
            ),
          ],
        ),
      ),
    
    
    );
  }
}

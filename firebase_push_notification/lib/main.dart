import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_push_notification/flutter_local_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? title = 'title';
  String? des = 'descriptoin';
  String? token;

  Future<void> getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    print('################### TOKEN ####################');
    print(token);
    print('##############################################');
  }

  Future<void> sendMessage(String title, String body) async {
    var respons = await post(
      Uri.parse("https://fcm.googleapis.com/fcm/send"),
      headers: {
        'content-type': 'application/json',
        "Authorization":
            'key=AAAABxSE6jU:APA91bHZkDUxRj89ZLOCVOtnTsxmTjjD-G_9LO3p1UQ9FKvFUkIO5v-jmXURzxNlJyIckLbCned3Co7vCCFfsIvLNddYJ5-IhMeQ1uaJLuInWv6HQjKJJDVxykLES3UB8ZXR7PttvtXK'
      },
      body: jsonEncode(
        {
          "registration_ids": [
            token,
          ],
          "notification": {
            "title": title,
            "body": body,
            "android_channel_id": "pushNotificationChanel1",
            "sound": true
          },
        },
      ),
    );

    print(respons.body);
  }

  void message(RemoteMessage rm) {
    title = rm.notification!.title;
    des = rm.notification!.body;
    setState(() {});
  }

  void popMessage(RemoteMessage rm) {
    String? t = rm.notification!.title;
    String? d = rm.notification!.body;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t!),
        content: Text(d!),
      ),
    );
  }

  @override
  void initState() {
    //generate token (past in body of http)
    getToken();

    //receave message during> background+foreground
    FirebaseMessaging.onMessage.listen(message);

    //tap notifiacation event
    FirebaseMessaging.onMessageOpenedApp.listen(popMessage);

    //

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase/Local Notification')),
      body: Column(
        children: [
          Text(title.toString()),
          Text(des.toString()),
          ElevatedButton(
            onPressed: () => sendMessage('Hello World', 'Mahadi Hassan Mithun'),
            child: const Text('Send Notify'),
          ),
          ElevatedButton(
            onPressed: () => LocalNotificationService().showNotification(
                id: 1, title: 'title local', body: 'body local notification', payload: 'pay_load1'),
            child: const Text('Local Notification'),
          ),
          ElevatedButton(
            onPressed: () => LocalNotificationService()
                .showNotificationPeriodcalOn(
                    id: 2,
                    title: 'title periodcally',
                    body: 'body periodically',
                    payload: 'pay_load2'),
            child:
                const Text('Local Notification Periodically ON (every minute)'),
          ),
          ElevatedButton(
            onPressed: () =>
                LocalNotificationService().showNotificationPeriodcalOff(),
            child: const Text(
                'Local Notification Periodically OFF (every minute)'),
          ),
        ],
      ),
    );
  }
}

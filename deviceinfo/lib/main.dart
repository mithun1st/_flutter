import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<String> info1() async {
    String str = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo1 = await deviceInfo.androidInfo;
      androidInfo1.toMap().forEach((key, value) {
        str += '$key => $value\n';
      });
      return str;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo1 = await deviceInfo.iosInfo;
      iosInfo1.toMap().forEach((key, value) {
        str += '$key => $value\n';
      });
      return str;
    } else if (kIsWeb) {
      WebBrowserInfo webInfo1 = await deviceInfo.webBrowserInfo;
      webInfo1.toMap().forEach((key, value) {
        str += '$key => $value\n';
      });
      return str;
    } else {
      return 'xxx';
    }
  }

  @override
  Widget build(BuildContext context) {
    final f = info1();
    print(f.runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: info1(),
          builder: (context, snapshot) {
            return Text(snapshot.data.toString());
          },
        ),
      ),
    );
  }
}

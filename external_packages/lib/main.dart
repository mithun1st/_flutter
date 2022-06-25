import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('External Package'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  DateTime? dt = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //import font
        /*
          1st download font1.ttf file from http://fonts.google.com
          2nd create folder asset/fonts/font1.ttf
          3rd update package from pubspec.yaml
        */
        const Text(
          'abcdefghijklmnopqqrstuvwxyz',
          style: TextStyle(
            fontFamily: 'font1',
            fontSize: 26,
          ),
        ),

        //import image
        /*
          1st download image1.png
          2nd create folder asset/image/image1.png
          3rd update package from pubspec.yaml
        */
        Image.asset(
          'assets/images/img1.png',
        ),

        //import datetime
        /*
          1st visit http://pub.dev
          2nd read Installing and API reference
        */
        Text(dt!.format('h:i:s A\tl\td/M/Y ').toString()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it1/dep_inj..dart';
import 'package:get_it1/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

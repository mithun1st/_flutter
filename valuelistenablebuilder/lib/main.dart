import 'package:flutter/material.dart';

void main() {
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

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final ValueNotifier<int> num = ValueNotifier<int>(0);
  int count = 10;
  @override
  Widget build(BuildContext context) {
    print('--It call once, when the data is changes also');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableBuilder'),
      ),
      body: ValueListenableBuilder(
        valueListenable: num,
        builder: (context, value, _) {
          return Text(value.toString());
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            num.value++;
          }),
    );
  }
}

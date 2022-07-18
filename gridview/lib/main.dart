import 'package:flutter/material.dart';

void main(List<String> args) {
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
  List<String> item = [
    'apple',
    'ball',
    'cat',
    'dog',
    'egg',
    'flower',
    'gold',
    'horse',
    'ice',
    'jug',
    'key',
    'lamp',
    'map',
    'night',
    'oil',
    'paper',
    'queen',
    'rat',
    'snake',
    'tea',
    'ufo',
    'village',
    'wolf',
    'xray',
    'yoyo',
    'zoo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Flexible(
              //GridView 1
              child: GridView.count(
                crossAxisCount: 4,
                children: item.map((e) => Text(e)).toList(),
              ),
            ),
          ),
          Container(
            height: 10,
            width: double.infinity,
            color: Colors.red,
          ),
          Flexible(
            //GridView 2
            child: GridView(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
              ),
              children: item.map((e) => Text(e)).toList(),
            ),
          ),
          Container(
            height: 10,
            width: double.infinity,
            color: Colors.red,
          ),
          Flexible(
            //GridView 3
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              ),
              itemCount: item.length,
              itemBuilder: (_, i) {
                return Text(item[i]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

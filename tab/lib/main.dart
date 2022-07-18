import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tab/page1.dart';
import 'package:tab/page2.dart';
import 'package:tab/page3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar'),
          bottom: TabBar(
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.black,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal),
            indicatorWeight: 10,
            indicatorColor: Colors.purple,
            splashBorderRadius: BorderRadius.circular(20),
            // indicator: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.yellow,
            //     width: 2,
            //   ),
            // ),
            tabs: [
              Tab(
                text: 'Home',
                icon: Icon(Icons.home),
                height: 100,
              ),
              Tab(
                text: 'Favorite',
                icon: Icon(Icons.favorite),
              ),
              Tab(
                child: Container(
                  height: 10,
                  width: 20,
                  color: Colors.orange,
                ),
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        
        bottomSheet: TabBar(
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.black,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          indicatorWeight: 10,
          indicatorColor: Colors.purple,
          splashBorderRadius: BorderRadius.circular(20),
          // indicator: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.yellow,
          //     width: 2,
          //   ),
          // ),
          tabs: [
            Tab(
              text: 'Home',
              icon: Icon(Icons.home),
              height: 100,
            ),
            Tab(
              text: 'Favorite',
              icon: Icon(Icons.favorite),
            ),
            Tab(
              child: Container(
                height: 10,
                width: 20,
                color: Colors.orange,
              ),
              icon: Icon(Icons.list),
            ),
          ],
        ),
        //-----------------------TabView
        body: TabBarView(children: [
          Home(),
          Favorite(),
          List1(),
        ]),
      ),
      //---
    );
  }
}

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
  String str = 'Click Here\\/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InkWell'),
      ),
      body: Column(
        children: [
          Text(
            str,
            style: const TextStyle(
              fontSize: 50,
            ),
          ),
          //inkwell 1
          InkWell(
            onTap: () => setState(() {
              str = 'On Tap';
            }),
            onDoubleTap: () => setState(() {
              str = 'Double Tap';
            }),
            onLongPress: () => setState(() {
              str = 'On Long Press';
            }),
            onHover: (b) => setState(() {
              str = b.toString();
            }),
            borderRadius: BorderRadius.circular(19),
            splashColor: Colors.red,
            child: const Icon(
              Icons.ads_click,
              size: 100,
              color: Colors.brown,
            ),
          ),
          //inkwell 2
          InkWell(
            onTap: (() {
              //
            }),
            splashColor: Colors.red,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: 80,
              width: 100,
              alignment: Alignment.center,
              child: Text('Hi There'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow.withOpacity(.5),
                    Colors.yellow,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

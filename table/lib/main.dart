import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table'),
      ),
      body: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
        border: TableBorder.all(
          width: 2,
          borderRadius: BorderRadius.circular(4),
        ),

        //defaultColumnWidth: FixedColumnWidth(120), //sw1
        //sw2
        columnWidths: const {
          0: FractionColumnWidth(.5), //column take 50% of width
          1: FractionColumnWidth(.25), //column take 25% of width
          2: FractionColumnWidth(.25), //column take 25% of width
        },
        children: [
          TableRow(
            children: [
              Text('data1'),
              Text('data2'),
              Text('data3'),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            children: [
              Text('data1'),
              Text('data2'),
              Text('data3'),
            ],
          ),
          //
          TableRow(
            children: [
              Text('data1'),
              Text('data2'),
              Container(
                height: 120,
                //width: 10,
                color: Colors.red,
              ),
            ],
          ),
          //
          TableRow(
            children: [
              Container(
                height: 50,
                width: 10,
                color: Colors.amber,
              ),
              Text('data2'),
              Text('data3'),
            ],
          ),
        ],
      ),
    );
  }
}

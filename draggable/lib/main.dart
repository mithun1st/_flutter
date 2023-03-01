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
    return _HomePageState();
  }
}

class _HomePageState extends State {
  Widget smallBox(Color c) {
    return Container(
      height: 20,
      width: 20,
      color: c,
    );
  }

  Widget largBox(Color c) {
    return Container(
      height: 80,
      width: 80,
      color: c,
    );
  }

  Color largBoxColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Draggable')),
      body: Container(
        height: 100,
        width: double.infinity,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Draggable(
                  child: smallBox(Colors.red),
                  feedback: smallBox(Colors.red.shade900),
                  data: Colors.red,
                  childWhenDragging: Text('red'),
                ),
                //
                Draggable(
                  child: smallBox(Colors.green),
                  feedback: smallBox(Colors.green.shade900),
                  data: Colors.green,
                  childWhenDragging: Icon(Icons.move_down),
                ),
                //
                Draggable(
                  child: smallBox(Colors.blue),
                  feedback: smallBox(Colors.blue.shade900),
                  data: Colors.blue,
                  //childWhenDragging: Icon(Icons.flag),
                ),
                //--
                Draggable(
                    child: smallBox(Colors.black),
                    feedback: Icon(Icons.read_more_sharp),
                    data: 'tag-1',
                    childWhenDragging: Text('position'),
                    onDragStarted: () => print('start'),
                    onDraggableCanceled: (velocity, offset) =>
                        print('cancel= ${velocity}-${offset}'),
                    onDragUpdate: (details) {
                      print('update-');
                      print('update= ${details.delta}');
                      print('update= ${details.globalPosition}');
                      print('update= ${details.localPosition}');
                      print('update= ${details.primaryDelta}');
                      print('update= ${details.sourceTimeStamp}');
                    },
                    onDragCompleted: () => print('done'),
                    onDragEnd: (details) {
                      print('end= ${details.offset}');
                      print('end= ${details.velocity}');
                      print('end= ${details.wasAccepted}');
                    }),
              ],
            ),
            const Text('drag left to right fill'),
            DragTarget(
              builder: (context, candidateData, rejectedData) {
                print('---------------------------------');

                if (candidateData.isNotEmpty && (candidateData[0]) is Color) {
                  largBoxColor = candidateData[0] as Color;
                }
                return largBox(largBoxColor.withOpacity(.4));
              },
            ),
          ],
        ),
      ),
    );
  }
}

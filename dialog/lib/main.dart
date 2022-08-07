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
  State createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dialog'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                //---------------Dialog
                showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        elevation: 12,
                        child: Container(
                          height: 400,
                          width: 200,
                          child: Text('Dialog Box'),
                        ),
                      );
                    });
              },
              child: null,
            ),
            ElevatedButton(
              onPressed: () {
                //---------------Alert Dialog
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Text('Do U wanna Save?'),
                      actions: [
                        TextButton(
                          onPressed: () => print('click yes'),
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: null,
            ),
            ElevatedButton(
              onPressed: () {
                //---------------About Dialog
                showDialog(
                  context: context,
                  builder: (_) {
                    return AboutDialog(
                      applicationIcon: Icon(Icons.home),
                      applicationName: 'About Dialog',
                      children: [
                        Text('data'),
                      ],
                    );
                  },
                );
              },
              child: null,
            ),
          ],
        ));
  }
}

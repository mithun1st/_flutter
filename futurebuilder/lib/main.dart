import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Future<String> fnc() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        //this function a like a Thred of Java
      },
    );
    // throw 'you got error insted of Data';  //sw1
    return 'You Got Data'; //sw2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder()'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //-------------------------Future Data
            FutureBuilder(
              future: fnc(),
              builder: (context, snapshot) {
                //waiting here
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                //if data has
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error);
                } else {
                  return const Text('XXXXXX');
                }
              },
            ),
            //------------------------------Future delay
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //future delay
                ElevatedButton(
                  child: Text('Delay'),
                  onPressed: () {
                    print('1. task');
                    Future.delayed(Duration(seconds: 2), () {
                      print('2. task');
                    });
                    print('3. task');
                  },
                ),
                //future await
                ElevatedButton(
                  child: Text('Away Delay'),
                  onPressed: () async {
                    print('A. task');
                    await Future.delayed(Duration(seconds: 2), () {
                      print('B. task');
                    });
                    print('C. task');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

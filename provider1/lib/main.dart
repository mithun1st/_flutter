import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/data_cls.dart';
import 'package:provider1/newPage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data1(),
      child: MaterialApp(
        home: HomePage(),
      ),
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
    //create obj of that class
    Data1 obj = Provider.of<Data1>(
      context,
      //true default, if false=> data read only one time
      //listen: false //sw1
      listen: true, //sw2
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
        child: Column(
          children: [
            //call var
            Text(obj.i.toString()),
            ElevatedButton(
              onPressed: () {
                //call fnc
                obj.inc();
              },
              child: const Text('Inc'),
            ),
            ElevatedButton(
              onPressed: () {
                //call fnc
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: ((context) => NewPage()),
                      ),
                    )
                    .then(
                      (value) => print(value),
                    );
              },
              child: const Text('New Page'),
            ),
          ],
        ),
      ),
    );
  }
}

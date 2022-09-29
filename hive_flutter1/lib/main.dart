import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox<int>('myBoxDb1');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  //--------------------declate
  Box<int>? box1;

  void write() {
    box1!.put('key1', count);
  }

  void read() {
    setState(() {
      count = box1!.get('key1') ?? -1;
    });
  }

  void delete() {
    box1!.delete('key1');
  }

  @override
  void initState() {
    box1 = Hive.box('myBoxDb1');
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hive_flutter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(count.toString()),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: Text('++')),
            ElevatedButton(onPressed: () => write(), child: Text('Save')),
            ElevatedButton(onPressed: () => read(), child: Text('Load')),
            ElevatedButton(onPressed: () => delete(), child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}

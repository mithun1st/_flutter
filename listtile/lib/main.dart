import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<String>? fullName = [
    'Mahadi Hassan',
    'Mohidul Hassan',
    'Mahadi Mohidul',
    'Hassan Hassan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile'),
      ),
      body: ListView.builder(
        itemCount: fullName!.length,
        itemBuilder: (c, p) {
          return Card(
            elevation: 8,
            //example of ListTile
            child: ListTile(
              //title
              leading: const Icon(
                Icons.account_box,
              ),
              title: const Text('Mithun'),
              //sub-title
              subtitle: Text(fullName![p]),
              //trailing
              trailing: IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  setState(() {
                    fullName!.removeAt(p);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

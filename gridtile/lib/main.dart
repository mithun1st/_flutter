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
  List<Student> l = [
    Student(id: 21, name: 'Mr. X', dep: 'cse'),
    Student(id: 12, name: 'Ms. Y', isMale: false),
    Student(id: 23, dep: 'eee', isMale: false),
    Student(id: 31, name: 'Mr. M', dep: 'eng'),
    Student(id: 12, name: 'Ms. N', isMale: true),
  ];

  @override
  Widget build(BuildContext context) {
    l.forEach((element) => print('${element.name} \t ${element.isMale}'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Tile'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: l.length,
          itemBuilder: (_, i) {
            return GridTile(
              header: Text(
                i.toString(),
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              child: Container(
                color: Colors.red,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.blue.withOpacity(.3),
                leading: Text(l[i].id.toString()),
                title: Text(l[i].name.toString()),
                subtitle: Text(l[i].dep.toString()),
                trailing: Text(l[i].isMale.toString()),
              ),
            );
          }),
    );
  }
}

class Student {
  int? id;
  String? name;
  String? dep;
  bool? isMale;

  Student({
    this.id,
    this.name,
    this.dep,
    this.isMale = true,
  });
}

import 'package:flutter/material.dart';
import 'package:hive1/models/con_file.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/*
//import those package
dep...
  hive:
  hive_flutter:

dev_de...
  hive_generator:
  build_runner:

//do in main method
import 'package:hive_flutter/hive_flutter.dart';
1.make main to async
2.then do- WidgetsFlutterBinding.ensureInitialized();
3.initial Hive-  await Hive.initFlutter();

//generate model
import 'package:hive/hive.dart';
part 'con_file.g.dart';

1. top of class- @HiveType(typeId: 0)
2. attribute of class- @HiveField(typeId: 0), @HiveField(typeId: 1)
3.go to terminal- >>flutter packages pub run build_runner build

*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init box
  await Hive.initFlutter();

  //reg the generate adapter
  Hive.registerAdapter(ContactAdapter());

  //create box
  await Hive.openBox<Contact>('myBox1');

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
  //to access our 'myBox1'
  late Box<Contact> boxObj1;
  List<Contact> contacts = [
    //   Contact(name: 'Mahadi', num: '017'),
    //   Contact(name: 'Hassan', num: '019'),
    //   Contact(name: 'Moin', num: '013'),
  ];
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numCtrl = TextEditingController();

  @override
  void initState() {
    //init the box
    boxObj1 = Hive.box('myBox1');

    //if (boxObj1.isNotEmpty) {
    boxObj1.values.forEach((element) {
      print('${element.name} - ${element.num}');
      contacts.add(element);
    });
    //}
    print('---------${boxObj1.isEmpty}');
    super.initState();
  }

  @override
  void dispose() {
    //Hive.close();
    Hive.box('myBox2').close();
    super.dispose();
  }

//fnc
  void createCon() {
    contacts.add(
      Contact(name: nameCtrl.text, num: numCtrl.text),
    );
    //boxObj1 = contacts as Box<Contact>;
    boxObj1.add(Contact(name: nameCtrl.text, num: numCtrl.text));
    setState(() {});
  }

  void updateCon(int i) {
    contacts[i] = Contact(name: nameCtrl.text, num: numCtrl.text);
    boxObj1.putAt(i, Contact(name: nameCtrl.text, num: numCtrl.text));
    setState(() {});
  }

  void deleteCon(int i) {
    contacts.removeAt(i);
    boxObj1.deleteAt(i);
    setState(() {});
  }

//wid fnc
  Widget readContact() {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (_, i) {
        return Card(
          color: Colors.grey.shade100,
          elevation: 10,
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => UpdateContact(i),
              ),
            ),
            title: Text(contacts[i].name),
            subtitle: Text(contacts[i].num),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteCon(i),
            ),
          ),
        );
      },
    );
  }

  Widget InputContact() {
    nameCtrl.text = '';
    numCtrl.text = '';
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(8),
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: numCtrl,
              decoration: const InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                createCon();
              },
              child: Text('Submitted'),
            ),
          ],
        ),
      ),
    );
  }

  Widget UpdateContact(int i) {
    nameCtrl.text = contacts[i].name;
    numCtrl.text = contacts[i].num;
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(8),
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: numCtrl,
              decoration: const InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                updateCon(i);
              },
              child: Text('Updated'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive'),
      ),
      body: readContact(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
            context: context,
            builder: (_) {
              return InputContact();
            }),
      ),
    );
  }
}

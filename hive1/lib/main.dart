import 'package:flutter/material.dart';
import 'models/con_file.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());

  await Hive.openBox<Contact>("myBox1");
  await Hive.openBox('myBox2');

  runApp(MyApp());
}

/*
//--1
dependencies:
  hive: ^[version]
  hive_flutter: ^[version]

dev_dependencies:
  hive_generator: ^[version]
  build_runner: ^[version]

//--2
part 'con_file.g.dart';

@HiveType(typeId: 0)
class Contact
  @HiveField(0)
  late final String name;

  @HiveField(1)
  late final String num;

//--3
>> flutter packages pub run build_runner build

//--4
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox<Contact>("myBox1");

  runApp(MyApp());
}

//--4
  late Box<Contact> box1;

  @override
  void initState() {
    box1 = Hive.box('myBox1');

    super.initState();
  }

  @override
  void dispose() {
    Hive.box('name').close();
    Hive.close();
    super.dispose();
  }

//--5
  box1.add(c);
  print(box1.getAt(i)!.name)
  print(box1.getAt(i)!.num)
  box1.put(i, c);
  box1.deleteAt(i);

*/

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
  late Box<Contact> box1;

  @override
  void initState() {
    box1 = Hive.box('myBox1');

    super.initState();
  }

  @override
  void dispose() {
    //Hive.box('myBox1').close();
    Hive.close();
    super.dispose();
  }

//--------------------------------------------- CRUD
  void createContact(Contact c) {
    box1.add(c);
    setState(() {});
  }

  /*
  read--
  print(box1.getAt(i)!.name)
  */

  void updateContact(Contact c, int i) {
    box1.put(i, c);
    setState(() {});
  }

  void deleteContact(int i) {
    box1.deleteAt(i);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dangerous),
            onPressed: () {
              box1.clear();
              setState(() {});
            },
          ),
          IconButton(
            icon: const Icon(Icons.get_app),
            onPressed: () {
              final Box b = Hive.box('myBox2');
              b.put('pi', 3.14);
              b.put(1, 'hi there');

              setState(() {});
            },
          ),
          IconButton(
            icon: const Icon(Icons.upload),
            onPressed: () {
              final Box b = Hive.box('myBox2');
              var v = b.toMap();
              print(v);

              print(b.get('pi'));
              setState(() {});
            },
          )
        ],
      ),
      body: ReadWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return InputFied(true, 0);
              });
        },
      ),
    );
  }

  Widget InputFied(bool con, int i) {
    TextEditingController c1 =
        TextEditingController(text: con ? '' : box1.getAt(i)!.name);
    TextEditingController c2 =
        TextEditingController(text: con ? '' : box1.getAt(i)!.num);
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: c1,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: c2,
              decoration: const InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              child: Text(con ? 'Submitted' : 'Update'),
              onPressed: () {
                Contact c = Contact(name: c1.text, num: c2.text);
                con ? createContact(c) : updateContact(c, i);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(con ? 'Contact Add' : 'Updated Contact'),
                  ),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget ReadWidget() {
    return ListView.builder(
      itemCount: box1.length,
      itemBuilder: (_, i) {
        return Card(
          color: Colors.grey.shade200,
          elevation: 12,
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                print('------------');
                showDialog(
                  context: context,
                  builder: (_) {
                    return InputFied(false, i);
                  },
                );
              },
            ),
            title: Text(box1.getAt(i)!.name),
            subtitle: Text(box1.getAt(i)!.num),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {
                deleteContact(i);
              },
            ),
          ),
        );
      },
    );
  }
}

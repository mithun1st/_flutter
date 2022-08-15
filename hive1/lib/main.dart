import 'package:flutter/material.dart';
import 'models/con_file.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<Contact> box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox<Contact>("myBox1");

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
  late Box<Contact> box1;

  @override
  void initState() {
    box1 = Hive.box('myBox1');

    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

//---------------------------------------------
  void createContact(Contact c) {
    box1.add(c);
    setState(() {});
  }

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

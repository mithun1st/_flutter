import 'package:flutter/material.dart';
import 'package:objectbox1/helper/objbx_help.dart';
import 'package:objectbox1/models/con_file.dart';

import 'objectbox.g.dart';

late ObjectBox ob;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ob = await ObjectBox.create();

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
    return HomePageState();
  }
}

class HomePageState extends State {
  late Box<Contact> box1;

  @override
  void initState() {
    box1 = ob.store.box<Contact>();
    if (box1.isEmpty()) {
      box1.put(Contact('alex', '12'));
      print('data insert');
    }
    //box1.put(Contact('bob', '43'));

    super.initState();
  }

  //--------------------------------------
  void createContact(Contact c) {
    box1.put(c);
    setState(() {});
  }

  void updateContact(Contact c, int i) {
    //box1.put(i, c);
    setState(() {});
  }

  void deleteContact(int i) {
    box1.remove(i + 1);
    setState(() {});
  }

  //-------------------------wid

  @override
  Widget build(BuildContext context) {
    print(box1.get(1)?.name.toString() ?? 'xx');
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Objectbox'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dangerous),
            onPressed: () {
              box1.removeAll();
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
        TextEditingController(text: con ? '' : box1.getAll()[i].name);
    TextEditingController c2 =
        TextEditingController(text: con ? '' : box1.getAll()[i].num);
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
                Contact c = Contact(c1.text, c2.text);
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
      itemCount: box1.getAll().length,
      itemBuilder: (_, i) {
        return Card(
          color: Colors.grey.shade200,
          elevation: 12,
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return InputFied(false, i);
                  },
                );
              },
            ),
            title: Text(box1.getAll()[i].name),
            subtitle: Text(box1.getAll()[i].num),
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

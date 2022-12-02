import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  //create
  Future<void> createProfile() async {
    DocumentReference dir = FirebaseFirestore.instance
        .collection('users')
        .doc('e8iGgtkz8GFdcQJZT2ew');
    Map<String, dynamic> profile = {
      'name': 'Mh Mithun',
      'isMale': true,
      'roll': 23,
      'mapEx': {
        'a': 'Apple',
        'b': 'Ball',
        'c': 'Cat',
      }
    };
    await dir.set(profile);
  }

  Future<void> createMap() async {
    DocumentReference dir = FirebaseFirestore.instance
        .collection('users')
        .doc('n6IDauMupGcMIhHu8Ayf');
    Map<String, dynamic> map = {
      'str': 'Hello World',
      'con': true,
      'num': 10,
      'pi': 3.1416,
    };
    await dir.set(map);
  }

  //read
  Stream<QuerySnapshot<Map<String, dynamic>>> readMapProfile() async* {
    yield* FirebaseFirestore.instance.collection('users').snapshots();
  }

  //update
  Future<void> updateProfile() async {
    DocumentReference dir = FirebaseFirestore.instance
        .collection('users')
        .doc('e8iGgtkz8GFdcQJZT2ew');
    Map<String, dynamic> profile = {
      'name': 'Mahadi Hassan',
      'mapEx.a': 'Alex',
      'mapEx.b': 'Bob',
      'mapEx.c': 'Charles',
    };
    await dir.update(profile);
  }

  //delete
  Future<void> deleteProfile() async {
    DocumentReference dir = FirebaseFirestore.instance
        .collection('users')
        .doc('e8iGgtkz8GFdcQJZT2ew');
    Map<String, dynamic> profile = {
      'isMale': FieldValue.delete(),
      'mapEx.c': FieldValue.delete(),
    };
    await dir.update(profile);
  }

  Future<void> deleteDoc() async {
    DocumentReference dir = FirebaseFirestore.instance
        .collection('users')
        .doc('n6IDauMupGcMIhHu8Ayf');
    dir.delete();
  }

  //---------------------------------------------------------------

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Database'),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: readMapProfile(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loding...');
              } else {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.toList().length,
                    itemBuilder: (context, index) {
                      List<DocumentSnapshot> documentSnapshot =
                          snapshot.data!.docs.toList();
                      return Column(
                        children: [
                          Text(documentSnapshot[index].id),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: (documentSnapshot[index].data()
                                    as Map<String, dynamic>)
                                .keys
                                .length,
                            itemBuilder: (context, i) {
                              Map<String, dynamic> map = documentSnapshot[index]
                                  .data() as Map<String, dynamic>;
                              return Text(
                                  '${map.keys.toList()[i]}\t:\t${map.values.toList()[i]}');
                            },
                          )
                        ],
                      );
                    },
                  ),
                );
              }
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await createProfile();
            },
            child: Text('Create Profile'),
          ),
          ElevatedButton(
            onPressed: () async {
              await createMap();
            },
            child: Text('Create Map'),
          ),
          ElevatedButton(
            onPressed: () async {
              await updateProfile();
            },
            child: Text('Update Item'),
          ),
          ElevatedButton(
            onPressed: () async {
              await deleteProfile();
            },
            child: Text('Delete Item'),
          ),
          ElevatedButton(
            onPressed: () async {
              await deleteDoc();
            },
            child: Text('Delete Map'),
          ),
        ],
      ),
    );
  }
}

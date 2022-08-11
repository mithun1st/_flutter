import 'package:api/remote.dart';
import 'package:api/models/profile.dart';
import 'package:flutter/material.dart';

void main() {
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

class HomePageState extends State {
  late List<Profile> list;

  Future<void> getData() async {
    list = await RemoteServer().fetchData();
    setState(() {});
  }

  Widget RecTile(Map<String, dynamic> mp, String title, Color c, double d) {
    return Container(
      color: c,
      margin: EdgeInsets.only(left: d),
      child: ExpansionTile(
        collapsedIconColor: Colors.yellow,
        initiallyExpanded: false,
        textColor: Colors.white,
        title: Text(title),
        children: mp.keys.map((e) {
          if (e == 'address') {
            return RecTile(mp[e], e.toUpperCase(), Colors.cyan, 40);
          } else if (e == 'geo') {
            return RecTile(mp[e], e.toUpperCase(), Colors.green, 60);
          } else if (e == 'company') {
            return RecTile(mp[e], e.toUpperCase(), Colors.cyan, 40);
          } else {
            return Text(mp[e].toString());
          }
        }).toList(),
      ),
    );
  }

  Widget UserTile1(Profile p) {
    Map<String, dynamic> mp = p.toJson();
    return Card(
      //color: Colors.purple,
      elevation: 12,
      child: RecTile(mp, 'User', Colors.yellow, 10),
    );
  }

  //-----------------
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final l = list[0].toJson();
    print(l['address']['geo'].runtimeType.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Rest'),
      ),
      body: FutureBuilder(
        future: RemoteServer().fetchData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error !!');
          } else if (snapshot.hasData && list != null) {
            //if data found from server
            print(snapshot.data.runtimeType);
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 12,
                  //--
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3,
                      color: Colors.red,
                    ),
                  ),
                  //--
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: RecTile(
                      list[index].toJson(), list[index].name, Colors.purple, 0),
                );
              },
            );
          } else {
            return Text('Unknown Error/Faild');
          }
        },
      ),
    );
  }
}

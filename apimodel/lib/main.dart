import 'package:apimodel/network.dart';
import 'package:flutter/material.dart';
import 'package:apimodel/models/user_model.dart';

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
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API As Model'),
      ),
      body: FutureBuilder(
        future: RemoteServer().fetchDataAsaModel(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error !!');
          } else if (snapshot.hasData) {
            //if data found from server
            return Text(snapshot.data.runtimeType.toString());
          } else {
            return Text('Unknown Error/Faild');
          }
        },
      ),
    );
  }
}

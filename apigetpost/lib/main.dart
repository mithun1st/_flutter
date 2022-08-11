import 'package:apigetpost/network.dart';
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

class HomePageState extends State<HomePage> {
  Widget ToAList(List<dynamic> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, i) {
        return Card(
          color: Colors.grey.shade200,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: Text(list[i]['userId'].toString()),
            title: Text(list[i]['title'].toString()),
            trailing: Text(list[i]['id'].toString()),
          ),
        );
      },
    );
  }

  Widget FetchData() {
    return FutureBuilder(
      future: RemoteServer().getDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return ToAList(snapshot.data as List<dynamic>);
        } else if (snapshot.hasError) {
          Text('Error');
        }
        return Icon(Icons.error);
      },
    );
  }

  Map<String, String> map = {};

  Widget SendData() {
    return Column(
      children: [
        Text('Status Code On Debug Console'),
        ElevatedButton(
          child: Text('Send Data'),
          onPressed: () {
            RemoteServer().postData({
              'userId': '2',
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Get & Post'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: FetchData(),
          ),
          Divider(
            color: Colors.black,
            thickness: 4,
          ),
          Flexible(
            //flex: 1,
            child: SendData(),
          ),
        ],
      ),
    );
  }
}

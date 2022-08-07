import 'package:flutter/material.dart';
import 'package:showsearch/search_cls.dart';

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
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> list = [
    'apple',
    'ball',
    'bambo',
    'cat',
    'candel',
    'cup',
  ];

  //
  List<String> filterList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('showSearch'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //--------------------showSearch
              showSearch(
                context: context,
                delegate: SearchDelegate1(list),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              //controller: c1,
              decoration: InputDecoration(
                label: Text('Search'),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 9,
                  ),
                ),
              ),
              onChanged: (s) {
                filterList =
                    list.where((element) => element.startsWith(s)).toList();
                print(filterList);
                setState(() {});
              },
            ),
            //suggestion
            if (filterList.isNotEmpty)
              Stack(
                children: [
                  Container(
                    height: 100,
                    color: Colors.red,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: filterList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(filterList[index]),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            Text('---------'),
          ],
        ),
      ),
    );
  }
}

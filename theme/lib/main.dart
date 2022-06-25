import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //DefineTheme
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.blue.shade100,
        highlightColor: Colors.blue,
        splashColor: Colors.black,
        toggleableActiveColor: Colors.green,
        //font theme
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                fontSize: 22,
                color: Colors.indigo,
              ),
              titleLarge: const TextStyle(
                fontSize: 28,
                color: Colors.brown,
              ),
            ),
        //appbar theme
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              foregroundColor: Colors.white,
              color: Colors.deepPurple,
              centerTitle: true,
            ),
        //Icon theme
        iconTheme: const IconThemeData(
          color: Colors.purple,
          size: 40,
        ),
        //
      ),

      title: 'Theme Ex',
      home: MyAppScreen(),
    );
  }
}

class MyAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text('Theme'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.cloud)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home),
            Text(
              'Hello World',
              //pick the theme value
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              'Example of Theme',
              //pick the theme value
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Switch(
                value: true,
                onChanged: (_) {
                  //need state less widget
                }),
            ElevatedButton(
              child: Text('Button'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                //pick the theme value
                primary: Theme.of(context).toggleableActiveColor,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.settings),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return Container();
              });
        },
      ),
    );
  }
}

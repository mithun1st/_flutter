import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // app bar variable
  AppBar? AppBarVar1 = AppBar(
    title: const Text('MediaQuery'),
  );

  @override
  Widget build(BuildContext context) {
    //size variable
    final double screenHeightSize = MediaQuery.of(context).size.height;
    final double screenWidthSize = MediaQuery.of(context).size.width;
    final double statusSize = MediaQuery.of(context).padding.top;
    final double appBarHeight = AppBarVar1!.preferredSize.height;

    return Scaffold(
      appBar: AppBarVar1,
      body: SingleChildScrollView(
        child: Container(
          /*
          container height take full available body height,
          and container width take 50% of screen width
          */
          height: screenHeightSize - (appBarHeight + statusSize),
          width: screenWidthSize * .5,
          color: Colors.blue[100],
          alignment: Alignment.center,
          child: const Icon(Icons.zoom_in_map),
        ),
      ),
    );
  }
}

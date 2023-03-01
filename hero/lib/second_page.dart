import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
          child: Hero(
        tag: 'tag-1',
        child: Icon(
          Icons.cloud_done,
          size: 200,
        ),
      )),
    );
  }
}

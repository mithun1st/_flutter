import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //pick data from Route as a __
    List<Object> list =
        ModalRoute.of(context)!.settings.arguments as List<Object>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.map((e) => Text(e.toString())).toList(),
        ),
      ),
    );
  }
}

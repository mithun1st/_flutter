import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  static const String routeName = '/pageC';

  @override
  Widget build(BuildContext context) {
    String receveData = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page C'),
      ),
      body: Center(
        child: Text('C\n$receveData'),
      ),
    );
  }
}

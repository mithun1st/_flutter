import 'package:flutter/material.dart';

class NewPageCon extends StatelessWidget {
  late String? str;

  NewPageCon({@required String? title}) {
    str = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page with Constructor'),
      ),
      body: Center(
        child: Text(
          str!,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

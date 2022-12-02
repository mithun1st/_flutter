import 'package:flutter/material.dart';

class GetDataFromNewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('POP page with \'Hello World\''),
          onPressed: () {
            //-----------data sent from here
            Navigator.of(context).pop('Hello World 1');
          },
        ),
      ),
    );
  }
}

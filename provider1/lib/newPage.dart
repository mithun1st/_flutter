import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/data_cls.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data1 o = Provider.of<Data1>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(o.i.toString()),
            ElevatedButton(
              onPressed: () {
                o.inc();
              },
              child: const Text('Inc'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop('M2N');
              },
              child: const Text('Pop'),
            ),
          ],
        ),
      ),
    );
  }
}

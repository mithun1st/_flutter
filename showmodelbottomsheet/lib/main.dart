import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  //fnc show model bottom sheet
  void sheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return CustomWidget(ctx);
      },
      elevation: 10,
    );
  }

// show widget fnc
  Widget CustomWidget(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.green.shade100,
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Field',
            ),
            keyboardType: TextInputType.phone,
          ),
          //
          const TextField(
            decoration: InputDecoration(
              labelText: 'Field 2',
            ),
            keyboardType: TextInputType.number,
          ),
          //
          ElevatedButton.icon(
            icon: const Icon(Icons.close),
            label: const Text('Pop'),
            onPressed: () {
              //close model bottom sheet
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Model Bottom Sheet'),
      ),
      body: OutlinedButton(
          child: const Text('PoP'),
          onPressed: () {
            //
            sheet(context);
          }),
      //float
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //
          sheet(context);
        },
      ),
    );
  }
}

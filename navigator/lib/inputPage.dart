import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputPageState();
  }
}

class InputPageState extends State<InputPage> {
  late var fnc;
  late var c;
  @override
  Widget build(BuildContext context) {
    //receive variable
    Map<String, Object> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    fnc = data['fnc1'];
    c = data['con1'];

    print(fnc.runtimeType);

    return Scaffold(
      appBar: AppBar(
        title: Text('Input'),
      ),
      body: Column(
        children: [
          TextField(
            controller: c,
            decoration: InputDecoration(
              label: Text('Text'),
              hintText: 'type',
            ),
            keyboardType: TextInputType.name,
          ),
          ElevatedButton(
              onPressed: () {
                fnc();
              },
              child: Text('Back to /'))
        ],
      ),
    );
  }
}

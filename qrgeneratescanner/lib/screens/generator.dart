import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generator extends StatefulWidget {
  final String routeName = 'gen';

  @override
  State<StatefulWidget> createState() {
    return GeneratorState();
  }
}

class GeneratorState extends State {
  TextEditingController c1 = TextEditingController();
  String? str = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            elevation: 20,
            child: QrImage(
              data: c1.text.toString(),
              size: 200,
              backgroundColor: Colors.white,
            ),
          ),
          Row(
            children: [
              //-----------
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: TextField(
                    controller: c1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //--------
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Generate'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

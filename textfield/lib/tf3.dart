import 'package:flutter/material.dart';

class TF3 extends StatefulWidget {
  @override
  State createState() {
    return TF3state();
  }
}

class TF3state extends State {
  String bs = 'show error';
  String? erStr;
  bool con = true;

  void check() {
    if (con) {
      erStr = 'Invalide !';
      bs = 'show default';
    } else {
      erStr = null;
      bs = 'show error';
    }
    con = !con;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Error Text Filed",
              hintText: 'type here . . .',
              prefixIcon: const Icon(Icons.phone),
              //error string
              errorText: erStr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: TextInputType.phone,
          ),

          //button
          ElevatedButton(
            onPressed: () {
              check();
              setState(() {});
            },
            child: Text(bs),
          ),
        ],
      ),
    );
  }
}

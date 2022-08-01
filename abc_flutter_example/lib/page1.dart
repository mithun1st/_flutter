import 'package:abc_flutter_example/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abc_flutter_example/itemMod.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Food i = ModalRoute.of(context)!.settings.arguments as Food;
    //Data1 o = Provider.of<Data1>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(i.name),
      ),
      body: Center(
        child: Text(i.fav.toString()),
      ),
    );
  }
}

import 'package:filter/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:filter/data.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Meal> li = ModalRoute.of(context)!.settings.arguments as List<Meal>;
    return Scaffold(
      appBar: AppBar(title: Text('Item List')),
      body: Column(
        children: li.map((e) => Text(e.mealName.toString())).toList(),
      ),
    );
  }
}

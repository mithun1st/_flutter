import 'package:filter/models/category.dart';
import 'package:filter/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:filter/data.dart';

class CategoryList extends StatelessWidget {
  void press(BuildContext ctx, Category e) {
    //method 1
    List<Meal> drink = Data.drinks.where((element) {
      return element.includeCategory!.contains(e.id);
    }).toList();

    //method 2
    /*Data.drinks.forEach((d) {
      if (d.includeCategory!.contains(e.id)) {
        drink.add(d);
      }
    });*/

    //---------
    Navigator.of(ctx).pushNamed(
      '/ItemPage',
      arguments: drink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      //crossAxisCount: 1,
      children: Data.menu.map((e) {
        return ElevatedButton(
          child: Text(e.title.toString()),
          onPressed: () => press(context, e),
        );
      }).toList(),
    );
  }
}

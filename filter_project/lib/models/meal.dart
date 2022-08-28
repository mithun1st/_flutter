import 'package:flutter/material.dart';

class Meal {
  final String? mealName;
  final List<String>? includeCategory;
  final String? ingredient;
  final bool suger;

  Meal({
    @required this.mealName,
    @required this.includeCategory,
    @required this.ingredient,
    required this.suger,
  });
}

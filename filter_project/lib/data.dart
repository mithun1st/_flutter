import 'package:filter/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:filter/models/category.dart';

class Data {
  static List<Category> menu = [
    Category(
      id: 'c1',
      title: 'Energy',
    ),
    Category(
      id: 'c2',
      title: 'Juice',
    ),
    Category(
      id: 'c3',
      title: 'Caffeine',
    ),
    Category(
      id: 'c4',
      title: 'AsUsual',
    ),
  ];

  //----------------------------------

  static List<Meal> drinks = [
    Meal(
      mealName: 'Tea',
      includeCategory: ['c3', 'c4'],
      ingredient: 'Tea Leaf, water',
      suger: true,
    ),
    Meal(
      mealName: 'Black Coffee',
      includeCategory: ['c3', 'c4'],
      ingredient: 'bean, water',
      suger: false,
    ),
    Meal(
      mealName: 'Sprite',
      includeCategory: ['c1'],
      ingredient: 'spri, water',
      suger: true,
    ),
    Meal(
      mealName: 'Lemon',
      includeCategory: ['c1', 'c2'],
      ingredient: 'Lemon, water, salt',
      suger: true,
    ),
    Meal(
      mealName: 'MilkShek',
      includeCategory: ['c2'],
      ingredient: 'milk, chocolate',
      suger: true,
    ),
    Meal(
      mealName: 'Orange',
      includeCategory: ['c2'],
      ingredient: 'Orange, water',
      suger: true,
    ),
    Meal(
      mealName: 'Water',
      includeCategory: ['c4'],
      ingredient: 'water',
      suger: false,
    ),
  ];
}

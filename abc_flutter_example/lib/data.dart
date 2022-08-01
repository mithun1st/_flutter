import 'package:flutter/widgets.dart';
import 'package:abc_flutter_example/itemMod.dart';

class Data1 with ChangeNotifier {
  List<Food> _foodStore = [
    Food(id: 01, name: 'apple'),
    Food(id: 03, name: 'berry', fav: true),
    Food(id: 04, name: 'cavier'),
  ];

  List<Food> get foodstore {
    return _foodStore;
  }

  void swFav(int i) {
    _foodStore[i].fav = !_foodStore[i].fav;
    notifyListeners();
  }

  void addFood() {
    _foodStore.add(Food(id: 5, name: 'donat'));
    notifyListeners();
  }
}

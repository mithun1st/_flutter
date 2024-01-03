import 'package:flutter/material.dart';

class ChangeNotifierProviderCtrl extends ChangeNotifier {
  int value = -1;

  void add(int i) {
    value += i;
    notifyListeners();
  }

  void reset() {
    value = 0;
    notifyListeners();
  }
}

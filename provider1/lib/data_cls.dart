import 'package:flutter/material.dart';

class Data1 with ChangeNotifier {
  int _i = 0;

  int get i {
    return _i;
  }

  void inc() {
    _i++;
    print(_i);
    notifyListeners();
  }
}

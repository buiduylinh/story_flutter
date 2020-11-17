import 'package:flutter/material.dart';

class SampleProvider extends  ChangeNotifier{
  int _count;

  void setCount(int value) {
    _count = value;
    notifyListeners();
  }

  int get count => _count;
}

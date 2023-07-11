import 'package:flutter/material.dart';

class ListController extends ChangeNotifier {
  final List<String> _todolist = [];

  List get todolist => _todolist;

  void add(String value) {
    print(value);
    _todolist.add(value);
    notifyListeners();
  }
}

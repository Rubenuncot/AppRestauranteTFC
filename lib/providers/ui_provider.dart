import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  bool _open = false;

  bool get open {
    return _open;
  }

  set open(bool open) {
    _open = open;
    notifyListeners();
  }
}
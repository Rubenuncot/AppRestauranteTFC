import 'package:flutter/material.dart';

class BoxModel {
  static int currentIndex = 0;
  int index;
  String name;
  IconData icon;
  Color color;

  BoxModel(
      this.name,
      this.icon,
      this.color,
      {this.index = 0});

  void incrementIndex(){
    currentIndex++;
    index = currentIndex;
  }
}
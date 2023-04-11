import 'package:flutter/material.dart';

import '../models/box_model.dart';

class BoxHelper {
  List<BoxModel> boxes;
  static List<BoxModel> allBoxes = [];

  BoxHelper(this.boxes);

  List<String> getNames() {
    List<String> names = [];
    for (var box in boxes) {
      if (!allBoxes.contains(box)) {
        allBoxes.add(box);
      }
      names.add(box.name);
    }

    return names;
  }

  List<IconData> getIcons() {
    List<IconData> icons = [];
    for (var box in boxes) {
      if (!allBoxes.contains(box)) {
        allBoxes.add(box);
      }
      icons.add(box.icon);
    }

    return icons;
  }

  String getRoute(int i) {
    String route = "";
    String optionName = "";
    for (var box in boxes) {
      if (!allBoxes.contains(box)) {
        allBoxes.add(box);
      }
    }

    for (var box in allBoxes) {
      if (box.index == i) {
        for (var i = 0; i < box.name.length; i++) {
          String letra = box.name.substring(i, i + 1);
          if (letra != ' ') {
            optionName = optionName + letra.toLowerCase();
          }
        }
        route = '_$optionName';
      }
    }
    return route;
  }

  List<Color> getColors() {
    List<Color> colors = [];
    for (var box in boxes) {
      colors.add(box.color);
    }

    return colors;
  }


}

import 'dart:ui';

import 'package:app_restaurante/helpers/box_helper.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  final BoxHelper helper;
  final int option;
  final Object? arguments;
  final double maxCrossAxisExtent;
  final String actualScreen;
  final void Function()? onTap;

  const CardTable(
      {super.key,
      required this.helper,
      required this.option,
      this.onTap,
      this.arguments,
      this.maxCrossAxisExtent = 0,
      this.actualScreen = 'empty'});

  double getNumberRows() {
    return (helper.boxes.length / 2).abs() + 1;
  }

  set crossAxisCount(int crossAxisCount) {
    this.crossAxisCount = crossAxisCount;
  }

  bool checkCrossAxisCount() {
    if (helper.boxes.length < 5) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 0;
    double maxCrossAxisCount;
    if (maxCrossAxisExtent == 0) {
      if (checkCrossAxisCount()) {
        crossAxisCount = 4;
        maxCrossAxisCount = 600;
      } else {
        crossAxisCount = 2;
        maxCrossAxisCount = 300;
      }
    } else {
      crossAxisCount = 4;
      if (maxCrossAxisExtent > 400) {
        maxCrossAxisCount = maxCrossAxisExtent;
      } else {
        maxCrossAxisCount = 400;
      }
    }
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxCrossAxisCount,
          childAspectRatio: crossAxisCount / 2,
        ),
        itemCount: helper.boxes.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                switch (option) {
                  case 0:
                    String route =
                        helper.getRoute(index + helper.boxes[0].index);
                    if (route.contains('comedor') ||
                        route.contains('terraza') ||
                        route.contains('saloninterior') ||
                        route.contains('barra')) {
                      Navigator.pushNamed(context, '_seleccionarmesa',
                          arguments:
                              helper.getBox(index + helper.boxes[0].index));
                    } else {
                      String name = helper.getNames()[index];
                      String number = '';
                      if (name.contains('.')) {
                        List<String> nameSplit = name.split('.');
                        number = nameSplit[1];
                      }

                      int? mesa = int.tryParse(number);
                      if (mesa != null) {
                        //TODO: Poner los argumentos de la mesa en cuestión (número de comensales, numero de la mesa, etc.)
                        Navigator.pushNamed(context, '_mesa',
                            arguments:
                                helper.getBox(index + helper.boxes[0].index));
                      } else {
                        Navigator.pushNamed(context, route,
                            arguments:
                                helper.getBox(index + helper.boxes[0].index));
                      }
                    }
                    break;
                  case 1:
                    if (onTap != null) {
                      onTap;
                    }
                    break;
                  case 3:
                    break;
                  default:
                    break;
                }
              },
              child: _SingleCard(
                icon: helper.getIcons()[index],
                color: helper.getColors()[index],
                text: helper.getNames()[index],
              ),
            ));
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: AppTheme.boxColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0.1, 0.5],
                            colors: [
                              const Color.fromARGB(255, 209, 209, 209),
                              color,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  text,
                  style: TextStyle(color: color, fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

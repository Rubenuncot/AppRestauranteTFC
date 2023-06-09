import 'package:app_restaurante/helpers/box_helper.dart';
import 'package:app_restaurante/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/box_model.dart';

class MainScreen extends StatelessWidget {
   
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BoxModel> boxes = [
      BoxModel('Seleccionar Sala', Icons.table_bar_rounded, Colors.red),
      BoxModel('Ver Facturas', Icons.card_travel, Colors.green),
      BoxModel('Ver Productos', Icons.production_quantity_limits, Colors.blue),
      BoxModel('Ajustes', Icons.settings, Colors.yellow),
    ];
    final boxHelper = BoxHelper(boxes);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          BackGround(size: size, image: 'utils/images/backgiffood.gif'),
          SafeArea(
            child: CardTable(
              option: 0,
              helper: boxHelper,
            )
          ),
        ]
      )
    );
  }
}
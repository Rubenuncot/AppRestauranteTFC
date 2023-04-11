import 'package:app_restaurante/helpers/box_helper.dart';
import 'package:app_restaurante/models/box_model.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SalaSelectionScreen extends StatelessWidget {
   
  const SalaSelectionScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    List<BoxModel> boxes = [
      BoxModel('Comedor', Icons.table_bar_rounded, Colors.red),
      BoxModel('Terraza', Icons.terrain, Colors.green),
      BoxModel('Salon Interior', Icons.table_bar_outlined, Colors.blue),
      BoxModel('Barra', Icons.sports_bar, Colors.yellow),
    ];

    for(var i = 0; i < boxes.length; i++){
      boxes[i].incrementIndex();
    }

    final boxHelper = BoxHelper(boxes);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          BackGround(size: size),
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
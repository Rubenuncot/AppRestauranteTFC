import 'package:app_restaurante/helpers/box_helper.dart';
import 'package:app_restaurante/models/box_model.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SalaSelectionScreen extends StatelessWidget {
   
  const SalaSelectionScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final BoxModel box = ModalRoute.of(context)?.settings.arguments as BoxModel;

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
      appBar: CustomAppBar(title: box.name),
      body: Stack(
        children: [
          BackGround(size: size, image: 'utils/images/backgiffood.gif',),
          SafeArea(
            child: CardTable(
              actualScreen: box.name,
              option: 0,
              helper: boxHelper,
            )
          ),
        ]
      )
    );
  }
}
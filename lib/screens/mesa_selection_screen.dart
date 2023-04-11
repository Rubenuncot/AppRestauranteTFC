import 'package:flutter/material.dart';

import '../helpers/box_helper.dart';
import '../models/box_model.dart';
import '../widgets/widgets.dart';

class MesaSelectionScreen extends StatelessWidget {
   
  const MesaSelectionScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final BoxModel box = ModalRoute.of(context)?.settings.arguments as BoxModel;
    String selectedPrefix = '';

    List<BoxModel> boxUper = [
      box
    ];

    switch(box.name){
      case 'Comedor':
        selectedPrefix = 'C.';
        break;
      case 'Terraza':
        selectedPrefix = 'T.';
        break;
      case 'Salon Interior':
        selectedPrefix = 'SI.';
        break;
      case 'Barra':
        selectedPrefix = 'B.';
        break;
    }
    final uperBoxHelper = BoxHelper(boxUper);

    List<BoxModel> boxes = [
      BoxModel('${selectedPrefix}1', Icons.looks_one_rounded, Colors.red),
      BoxModel('${selectedPrefix}2', Icons.looks_two_rounded, Colors.green),
      BoxModel('${selectedPrefix}3', Icons.looks_3_rounded, Colors.blue),
      BoxModel('${selectedPrefix}4', Icons.looks_4_rounded, Colors.yellow),
      BoxModel('${selectedPrefix}5', Icons.looks_5_rounded, Colors.yellow),
      BoxModel('${selectedPrefix}6', Icons.looks_6_rounded, Colors.yellow),
    ];
    boxUper[0].incrementIndex();
    for(var i = 0; i < boxes.length; i++){
      boxes[i].incrementIndex();
    }

    final boxHelper = BoxHelper(boxes);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: boxUper[0].name),
      body: Stack(
        children: [
          BackGround(size: size, image: 'utils/images/backgiffood.gif',),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  child: CardTable(
                    option: 3,
                    helper: uperBoxHelper,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.6,
                  child: CardTable(
                    option: 0,
                    helper: boxHelper,
                  ),
                ),
              ],
            )
          ),
        ]
      )
    );
  }
}
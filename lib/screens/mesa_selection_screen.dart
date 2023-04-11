import 'package:flutter/material.dart';

import '../helpers/box_helper.dart';
import '../models/box_model.dart';
import '../widgets/widgets.dart';

class MesaSelectionScreen extends StatelessWidget {
   
  const MesaSelectionScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    List<BoxModel> boxUper = [
      BoxModel('Comedor', Icons.table_bar, Colors.pink),
    ];

    final uperBoxHelper = BoxHelper(boxUper);

    List<BoxModel> boxes = [
      BoxModel('1', Icons.looks_one_rounded, Colors.red),
      BoxModel('2', Icons.looks_two_rounded, Colors.green),
      BoxModel('3', Icons.looks_3_rounded, Colors.blue),
      BoxModel('4', Icons.looks_4_rounded, Colors.yellow),
      BoxModel('5', Icons.looks_5_rounded, Colors.yellow),
      BoxModel('6', Icons.looks_6_rounded, Colors.yellow),
    ];
    boxUper[0].incrementIndex();
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
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: CardTable(
                    option: 3,
                    helper: uperBoxHelper,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.65,
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
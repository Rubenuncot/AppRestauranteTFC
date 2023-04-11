import 'package:app_restaurante/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/box_helper.dart';
import '../models/box_model.dart';
import '../widgets/widgets.dart';

class MesaScreen extends StatelessWidget {
   
  const MesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BoxModel> boxUper = [
      BoxModel('Salon', Icons.table_bar, Colors.pink),
    ];

    final uperBoxHelper = BoxHelper(boxUper);

    List<BoxModel> boxes = [
      BoxModel('Refrescos', Icons.looks_one_rounded, Colors.red),
      BoxModel('Cervezas', Icons.looks_two_rounded, Colors.green),
      BoxModel('Vinos Tintos', Icons.looks_3_rounded, Colors.blue),
      BoxModel('Vinos Blancos', Icons.looks_4_rounded, Colors.yellow),
      BoxModel('Carnes', Icons.looks_5_rounded, Colors.yellow),
      BoxModel('Pescados', Icons.looks_6_rounded, Colors.yellow),
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
                  height: size.height * 0.5,
                  child: CardTable(
                    option: 2,
                    helper: boxHelper,
                  ),
                ),
              ],
            )
          ),
        ]
      ),
      drawer: const Drawer(backgroundColor: Colors.indigo),
    );
  }
}
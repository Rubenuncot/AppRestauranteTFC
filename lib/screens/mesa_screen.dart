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

    final BoxModel box = ModalRoute.of(context)?.settings.arguments as BoxModel;

    List<BoxModel> boxUper = [
      BoxModel('Mesa ${box.name}', box.icon, Colors.pink),
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

    final boxHelper = BoxHelper(boxes);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: boxUper[0].name),
      floatingActionButton: const CustomSideBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.2),
                  child: SizedBox(
                    height: size.height * 0.6,
                    child: CardTable(
                      circleSize: 30,
                      iconSize: 30,
                      fontSize: 15,
                      crossAxisCount: 2,
                      option: 2,
                      helper: boxHelper,
                    ),
                  ),
                ),
              ],
            )
          ),
        ]
      ),
    );
  }
}
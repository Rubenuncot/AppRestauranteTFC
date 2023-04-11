import 'package:app_restaurante/helpers/box_helper.dart';
import 'package:app_restaurante/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/box_model.dart';

class ConfigScreen extends StatelessWidget {
   
  const ConfigScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final BoxModel box = ModalRoute.of(context)?.settings.arguments as BoxModel;

    List<BoxModel> boxes = [
      BoxModel('Cambiar Tema', Icons.color_lens_outlined, Colors.red),
      BoxModel('Información de Usuario', Icons.supervised_user_circle, Colors.green),
      BoxModel('Información de Versión', Icons.verified, Colors.blue)
    ];

    final boxHelper = BoxHelper(boxes);

    for(var i = 0; i < boxes.length; i++){
      boxes[i].incrementIndex();
    }

    return Scaffold(
      appBar: CustomAppBar(title: box.name),
      body: Stack(
        children: [
          BackGround(size: size, image: 'utils/images/backgiffood.gif',),
          CardTable(
            maxCrossAxisExtent: 500,
            option: 3,
            helper: boxHelper,
          )
        ],
      ),
    );
  }
}
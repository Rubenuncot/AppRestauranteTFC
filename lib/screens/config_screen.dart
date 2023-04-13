import 'package:app_restaurante/helpers/box_helper.dart';
import 'package:app_restaurante/providers/theme_provider.dart';
import 'package:app_restaurante/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/box_model.dart';

class ConfigScreen extends StatelessWidget {
   
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final BoxModel box = ModalRoute.of(context)?.settings.arguments as BoxModel;
    bool isLightTheme = Provider.of<ThemeProvider>(context).currentThemeName == 'light';

    List<BoxModel> boxes = [
      BoxModel('Cambiar Tema (${isLightTheme ? 'Claro' : 'Oscuro'})', Icons.color_lens_outlined, Provider.of<ThemeProvider>(context).currentThemeName == 'light' ? Colors.red : Colors.black38),
      BoxModel('Información de Usuario', Icons.supervised_user_circle, Colors.green),
      BoxModel('Información de Versión', Icons.verified, Colors.blue)
    ];

    final boxHelper = BoxHelper(boxes);


    return Scaffold(
      appBar: CustomAppBar(title: box.name),
      body: Stack(
        children: [
          BackGround(size: size, image: 'utils/images/backgiffood.gif',),
          CardTable(
            actualScreen: 'ajustes',
            maxCrossAxisExtent: 500,
            option: 1,
            helper: boxHelper,
          )
        ],
      ),
    );
  }
}


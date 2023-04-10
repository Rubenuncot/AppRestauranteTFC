import 'package:app_restaurante/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
   
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackGround(size: size),
          const SafeArea(
            child: CardTable(
              icons: [
                Icons.table_bar_rounded, 
                Icons.add_chart_sharp, 
                Icons.production_quantity_limits_rounded, 
                Icons.settings
              ], 
              names: [
                'Seleccionar Sala', 
                'Ver Facturas', 
                'Ver Productos', 
                'Configuración'
              ], 
              routes: [
                '_salaSelection', 
                '_invoice',
                '_product',
                '_config',
              ],)
          ),
        ]
      )
    );
  }
}
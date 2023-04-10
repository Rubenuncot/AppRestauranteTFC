import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SalaSelectionScreen extends StatelessWidget {
   
  const SalaSelectionScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    List<String> salas = ['Comedor', 'Terraza', 'Salón Interior', 'Barra'];

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackGround(size: size),
          SafeArea(
            child: CardTable(
              icons: const [
                Icons.table_bar_rounded, 
                Icons.terrain, 
                Icons.table_bar_outlined, 
                Icons.sports_bar
              ], 
              names: salas, 
              routes: const [
                '_mesaSelection', 
                '_mesaSelection',
                '_mesaSelection',
                '_mesaSelection',
              ],)
          ),
        ]
      )
    );
  }
}
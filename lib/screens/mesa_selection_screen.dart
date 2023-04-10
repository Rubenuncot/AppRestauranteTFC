import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class MesaSelectionScreen extends StatelessWidget {
   
  const MesaSelectionScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    List<String> mesas = ['1', '2', '3', '4', '5', '6', '7 '];
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
                  child: const CardTable(
                    icons: [
                      Icons.table_bar, 
                    ], 
                    names: ['Comedor'], 
                    routes: ['hola'],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.65,
                  child: CardTable(
                    icons: const [
                      Icons.looks_one, 
                      Icons.looks_two, 
                      Icons.looks_3, 
                      Icons.looks_4,
                      Icons.looks_5,
                      Icons.looks_6,
                      Icons.numbers_rounded,
                    ], 
                    names: mesas, 
                    routes: const [
                      '_mesa',
                      '_mesa',
                      '_mesa',
                      '_mesa',
                      '_mesa',
                      '_mesa',
                      '_mesa',
                    ],
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
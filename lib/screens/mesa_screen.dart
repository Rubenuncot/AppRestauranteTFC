import 'package:app_restaurante/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class MesaScreen extends StatelessWidget {
   
  const MesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final open = uiProvider.open;
    List<String> mesas = ['Refrescos', 'Café', 'Cervezas', 'Vino Blanco', 'Vino Tinto', 'Ensalada', 'Pescado'];
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
                  child: InkWell(
                    onTap: () {print('Hola');},
                    child: const CardTable(
                      icons: [
                        Icons.looks_one, 
                      ], 
                      names: ['Mesa 1'], 
                      routes: ['empty'],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: CardTable(
                    icons: const [
                      Icons.bubble_chart_outlined, 
                      Icons.coffee, 
                      Icons.sports_bar, 
                      Icons.wine_bar_outlined,
                      Icons.wine_bar,
                      Icons.local_florist_sharp,
                      Icons.set_meal_sharp,
                    ], 
                    names: mesas, 
                    routes: mesas,
                  ),
                ),
              ],
            )
          ),
          if(uiProvider.open) SafeArea(
            child: Container(
              color: Colors.amber,
              width: 300,
              height: 300,
            )
          )
        ]
      ),
      drawer: const Drawer(backgroundColor: Colors.indigo),
    );
  }
}
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  final List<String> names;
  final List<IconData> icons;
  final List<String> routes;
  
  const CardTable({super.key, required this.names, required this.icons, required this.routes});
  

  double getNumberRows(){
    return (names.length / 2).abs() + 1;
  }

  List<Color> randomColorGenerator(){
    List<Color> colors = [];
    for(var i = 0; i < names.length; i++){
      colors.add(Color.fromARGB(255, 185, Random().nextInt(255) + 185, Random().nextInt(255) + 185));
      // colors.add(Color.fromRGBO(255, 185, 185, 1));
    }
    return colors;
  }

  List<IconData> checkIconsLength(){
    List<IconData> iconsModi = [];
    int dif = 0;
    if(icons.length != names.length){
      if(icons.length > names.length){
        dif = icons.length - names.length;
        for(var i = 0; i < dif; i++){
          iconsModi.add(icons[i]);
        }
      } else {
        dif = names.length - icons.length;
        for(var i = 0; i < icons.length; i++){
          iconsModi.add(icons[i]);
        }
        for(var i = 0; i < dif; i++){
          iconsModi.add(Icons.hourglass_empty_outlined);
        }
      }
    } else {
      iconsModi = icons;
    }
    return iconsModi;
  }

  set crossAxisCount(int crossAxisCount){
    this.crossAxisCount = crossAxisCount;
  }

  bool checkCrossAxisCount(){
    if(names.length < 5){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var iconsModify = checkIconsLength();
    int crossAxisCount = 0; 
    double maxCrossAxisExtent = 0; 
    if(checkCrossAxisCount()){
      crossAxisCount = 4;
      maxCrossAxisExtent = 500;
    } else {
      crossAxisCount = 2;
      maxCrossAxisExtent = 300;
    }
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        childAspectRatio: crossAxisCount / 2,
      ),
      itemCount: names.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => 
        _SingleCard(icon: iconsModify[index], color: randomColorGenerator()[index], text: names[index], route: routes[index] ),
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String route;

  const _SingleCard({
    super.key, 
    required this.icon, 
    required this.color, 
    required this.text, 
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color:const Color.fromARGB(129, 29, 27, 10),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: const [0.1, 0.5],
                          colors: [
                            const Color.fromARGB(255, 209, 209, 209),
                            color,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(icon, color: Colors.white, size: 35,)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(text, style: TextStyle(color: color, fontSize: 15),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
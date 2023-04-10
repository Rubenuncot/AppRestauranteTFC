import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BackGround extends StatelessWidget {
  final Size size;
  const BackGround({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: size.height,
            child:
              const FadeInImage(
                placeholder: AssetImage('utils/images/backgiffood.gif'), 
                image: AssetImage('utils/images/backgiffood.gif'),
                repeat: ImageRepeat.repeatY,
              ),
          ),
          Container(
            height: size.height,
            color: Colors.black54,
          ),
      ],
    );
  }
}
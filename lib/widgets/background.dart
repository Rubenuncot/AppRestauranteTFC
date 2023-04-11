import 'package:app_restaurante/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final Size size;
  final String image;
  const BackGround({super.key, required this.size, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: size.height,
            child:
              FadeInImage(
                placeholder: AssetImage(image),
                image: AssetImage(image),
                repeat: ImageRepeat.repeatY,
              ),
          ),
          Container(
            height: size.height,
            color: AppTheme.backgroundColor,
          ),
      ],
    );
  }
}
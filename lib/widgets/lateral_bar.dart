import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(20)),
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(168, 139, 139, 241),
                  backgroundBlendMode: BlendMode.dstOut),
              margin: const EdgeInsets.all(0),
              height: size.height * 0.6,
              width: size.width * 0.15,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _iconButtom(
                      ZoomTapAnimation(
                          onTap: () {},
                          child: const Icon(
                            Icons.construction_sharp,
                            color: Colors.white,
                          )),
                    ),
                    const Divider(color: Colors.white),
                    _iconButtom(
                      ZoomTapAnimation(
                          onTap: () {},
                          child: const Icon(
                            Icons.inventory,
                            color: Colors.white,
                          )),
                    ),
                    _iconButtom(
                      ZoomTapAnimation(
                          onTap: () {},
                          child: const Icon(
                            Icons.person_search_outlined,
                            color: Colors.white,
                          )),
                    ),
                    _iconButtom(
                      ZoomTapAnimation(
                          onTap: () {},
                          child: const Icon(
                            Icons.edit_document,
                            color: Colors.white,
                          )),
                    ),
                    _iconButtom(
                      ZoomTapAnimation(
                          onTap: () {},
                          child: const Icon(
                            Icons.comment,
                            color: Colors.white,
                          )),
                    ),
                    const Divider(color: Colors.white),
                    _iconButtom(
                      ZoomTapAnimation(
                          onTap: () {},
                          child: const Icon(
                            Icons.menu_open,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ZoomTapAnimation _iconButtom(Widget child) {
    return ZoomTapAnimation(
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.white38, Colors.transparent],
                begin: Alignment.topCenter,
                stops: [0, 10]),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white70)),
        child: child,
      ),
    );
  }
}

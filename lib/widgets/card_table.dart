import 'dart:ui';

import 'package:app_restaurante/helpers/box_helper.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:app_restaurante/widgets/AlertDialogCustom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../providers/theme_provider.dart';
import '../shared_preferences/preferences.dart';

class CardTable extends StatefulWidget {
  final BoxHelper helper;
  final int option;
  final double iconSize;
  final double fontSize;
  final Object? arguments;
  final int crossAxisCount;
  final double maxCrossAxisExtent;
  final String actualScreen;
  final void Function()? onTap;
  final Widget child;
  final double circleSize;

  const CardTable(
      {super.key,
      required this.helper,
      required this.option,
      this.onTap,
      this.arguments,
      this.maxCrossAxisExtent = 0,
      this.actualScreen = 'empty',
      this.child = const Text('alert'),
      this.crossAxisCount = 1,
      this.iconSize = 35,
      this.fontSize = 15,
      this.circleSize = 35});

  @override
  State<CardTable> createState() => _CardTableState();
}

class _CardTableState extends State<CardTable> {
  double getNumberRows() {
    return (widget.helper.boxes.length / 2).abs() + 1;
  }

  set crossAxisCount(int crossAxisCount) {
    this.crossAxisCount = crossAxisCount;
  }

  bool checkCrossAxisCount() {
    if (widget.helper.boxes.length < 5) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 175,
          childAspectRatio: widget.crossAxisCount / 2,
          crossAxisCount: widget.crossAxisCount,
        ),
        itemCount: widget.helper.boxes.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => ZoomTapAnimation(
              endCurve: Curves.elasticOut,
              onTap: () async {
                switch (widget.option) {
                  case 0:
                    String route = widget.helper
                        .getRoute(index + widget.helper.boxes[0].index);
                    if (route.contains('comedor') ||
                        route.contains('terraza') ||
                        route.contains('saloninterior') ||
                        route.contains('barra')) {
                      Navigator.pushNamed(context, '_seleccionarmesa',
                          arguments: widget.helper
                              .getBox(index + widget.helper.boxes[0].index));
                    } else {
                      String name = widget.helper.getNames()[index];
                      String number = '';
                      if (name.contains('.')) {
                        List<String> nameSplit = name.split('.');
                        number = nameSplit[1];
                      }

                      int? mesa = int.tryParse(number);
                      if (mesa != null) {
                        //TODO: Poner los argumentos de la mesa en cuestión (número de comensales, numero de la mesa, etc.)
                        Navigator.pushNamed(context, '_mesa',
                            arguments: widget.helper
                                .getBox(index + widget.helper.boxes[0].index));
                      } else {
                        Navigator.pushNamed(context, route,
                            arguments: widget.helper
                                .getBox(index + widget.helper.boxes[0].index));
                      }
                    }
                    break;
                  case 1:
                    if (widget.actualScreen != 'empty') {
                      if (widget.actualScreen == 'ajustes') {
                        switch (index) {
                          case 0:
                            if (!Preferences.isDarkMode) {
                              Preferences.isDarkMode = true;
                              Preferences.theme = 'dark';
                              final themeProvider = Provider.of<ThemeProvider>(
                                  context,
                                  listen: false);
                              themeProvider.setDarktMode();
                              setState(() {});
                            } else {
                              Preferences.isDarkMode = false;
                              Preferences.theme = 'light';
                              final themeProvider = Provider.of<ThemeProvider>(
                                  context,
                                  listen: false);
                              themeProvider.setLightMode();
                            }
                            break;
                          case 1:
                            if (widget.child != const Text('alert')) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialogCustom(
                                      icono: Icons.person_pin,
                                      titulo: 'Información de Usuario',
                                      contenido: Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            _buildRowUser(
                                                'Usuario: ',
                                                const Text(
                                                    'Nombre del Usuario')),
                                            const Divider(),
                                            _buildRowUser(
                                              'Código QR: ',
                                              const Text(
                                                  'Código QR del Usuario',
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 2),
                                            ),
                                            const Divider(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Imagen QR: ',
                                                  style: primaryTextStyle(),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const FadeInImage(
                                                    placeholder: AssetImage(
                                                        'utils/images/qr.jfif'),
                                                    image: AssetImage(
                                                        'utils/images/qr.jfif')),
                                              ],
                                            ),
                                            const Divider(),
                                            _buildRowUser(
                                              'Contratado como: ',
                                              const Text('Rol del usuario'),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                              );
                            }
                            break;
                          case 2:
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogCustom(
                                    icono: Icons.verified_user_sharp,
                                    iconColor: Colors.indigo,
                                    titulo: 'Información De la Versión',
                                    contenido: Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          _buildRowUser('Applicación: ',
                                              const Text('Restaurante App')),
                                          const Divider(),
                                          _buildRowUser(
                                              'Version: ', const Text('1.0.0')),
                                          const Divider(),
                                          _buildRowUser('Desarrolladores: ',
                                              const Text('Rubén')),
                                        ],
                                      ),
                                    ));
                              },
                            );
                            break;
                        }
                      }
                    }
                    break;
                  case 3:
                    break;
                  default:
                    break;
                }
              },
              child: _SingleCard(
                iconSize: widget.iconSize,
                icon: widget.helper.getIcons()[index],
                color: widget.helper.getColors()[index],
                text: widget.helper.getNames()[index],
                fontSize: widget.fontSize,
                circleSize: widget.circleSize,
              ),
            ));
  }

  Row _buildRowUser(String title, Widget content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryTextStyle(),
        ),
        content
      ],
    );
  }

  TextStyle primaryTextStyle() =>
      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final double iconSize;
  final double circleSize;
  final double fontSize;

  const _SingleCard({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
    required this.iconSize,
    required this.fontSize,
    required this.circleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          color: AppTheme.shadowColorDark,
          blurRadius: 50,
          blurStyle: BlurStyle.outer,
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: AppTheme.boxColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: circleSize,
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
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: iconSize,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  text,
                  style: TextStyle(color: color, fontSize: fontSize),
                  maxLines: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

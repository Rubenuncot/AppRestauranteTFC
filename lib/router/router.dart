
import 'package:flutter/material.dart';

import '../models/menu_option.dart';
import '../screens/screens.dart';

class RoutesList {
  static String initialRoute = "_home";

  static final menuOptions = <MenuOption>[
    MenuOption(
        name: 'main',
        icon: Icons.list,
        screen: const MainScreen(),
        route: "_main"),
    MenuOption(
        name: 'ajustes',
        icon: Icons.list_alt,
        screen: const ConfigScreen(),
        route: '_ajustes'),
    MenuOption(
        name: 'invoice',
        icon: Icons.alarm,
        screen: const InvoiceScreen(),
        route: '_invoice'),
    MenuOption(
        name: 'product',
        icon: Icons.call_to_action_rounded,
        screen: const ProductScreen(),
        route: '_product'),
    MenuOption(
        name: 'mesa',
        icon: Icons.supervised_user_circle,
        screen: const MesaScreen(),
        route: '_mesa'),
    MenuOption(
        name: 'seleccionarmesa',
        icon: Icons.animation,
        screen: const MesaSelectionScreen(),
        route: '_seleccionarmesa'),
    MenuOption(
        name: 'seleccionarsala',
        icon: Icons.input,
        screen: const SalaSelectionScreen(),
        route: '_seleccionarsala'),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final e in menuOptions) {
      appRoutes.addAll({e.route: (BuildContext context) => e.screen});
    }

    return appRoutes;
  }

  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColorDark = Color.fromARGB(255, 20, 26, 59);
  static const String backgroundImage = 'utils/images/backgiffood.gif';
  static Color secondaryColorDark = Colors.indigo;
  static Color? backgroundColorDark = const Color.fromARGB(200, 39, 39, 56);
  static Color shadowColorDark = const Color.fromARGB(53, 255, 255, 255);
  static const Color primaryColorLight = Colors.indigo;
  static Color secondaryColorLight = Colors.indigo.shade300;
  static Color? backgroundColorLight = const Color.fromARGB(139, 38, 38, 182);
  static Color? boxColor= const Color.fromARGB(108, 255, 255, 255);
  static Color shadowColorLight = const Color.fromARGB(97, 0, 0, 0);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //Color Primario
      primaryColor: primaryColorLight,
      appBarTheme: const AppBarTheme(
          color: primaryColorLight, elevation: 5, shadowColor: primaryColorLight),

      //Card Theme
      cardTheme: const CardTheme(shadowColor: primaryColorLight, elevation: 30),



      //TextButtom Theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColorLight)),

      //FloatingActionButton Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColorLight, elevation: 5),

      //InputDecoration Theme
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColorLight),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColorLight),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),


      ),


      //ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColorLight,
              shape: const StadiumBorder(),
              elevation: 0)));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //Color Primario
      primaryColor: primaryColorDark,
      appBarTheme: const AppBarTheme(
          color: primaryColorDark, elevation: 5, shadowColor: primaryColorDark),

      //Card Theme
      cardTheme: const CardTheme(shadowColor: primaryColorDark, elevation: 30),

      //TextButtom Theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColorDark)),

      //FloatingActionButton Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColorDark, elevation: 5),

      //InputDecoration Theme
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColorDark),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColorDark),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),


      ),

      //ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColorDark,
              shape: const StadiumBorder(),
              elevation: 0)));

}

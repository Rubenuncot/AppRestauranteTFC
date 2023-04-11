import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigo;
  static Color secondaryColor = Colors.indigo.shade300;
  static Color? backgroundColor = const Color.fromARGB(200, 0, 0, 75);
  static Color? boxColor = const Color.fromARGB(60, 255, 255, 255);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //Color Primario
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
          color: primaryColor, elevation: 5, shadowColor: primaryColor),

      //Card Theme
      cardTheme: const CardTheme(shadowColor: primaryColor, elevation: 30),

      //TextButtom Theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColor)),

      //FloatingActionButton Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor, elevation: 5),

      //InputDecoration Theme
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
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
              backgroundColor: primaryColor,
              shape: const StadiumBorder(),
              elevation: 0)));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      //Primary Color
      primaryColor: primaryColor,

      //AppBar theme
      appBarTheme: const AppBarTheme(
          color: primaryColor, elevation: 5, shadowColor: primaryColor),

      //Card Theme
      cardColor: secondaryColor,
      cardTheme: const CardTheme(shadowColor: primaryColor),

      //TextButtom Theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColor)));
}

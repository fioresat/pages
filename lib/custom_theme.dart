import 'package:flutter/material.dart';


class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.deepPurple,
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.white,
      cardTheme: CardTheme(
        margin: const EdgeInsets.all(15),
        elevation: 4,
        color: Colors.transparent,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.deepPurple, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

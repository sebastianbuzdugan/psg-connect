import 'package:flutter/material.dart';

@immutable
class ColorPalette {
  const ColorPalette._();
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
    static const greyColor2 = Color.fromRGBO(47, 54, 58, 1); // secondary color

  static const faithColor = Color.fromARGB(255, 215, 215, 215); // secondary color
  static const pinkColor = Color.fromARGB(255, 241, 204, 217);
  static const purpleColor = Colors.indigoAccent;
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const fbColor = Color(0xFF1778F2);
  static const socialMediaIconBgColor = Color.fromARGB(197, 246, 246, 246);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Color.fromARGB(255, 120, 217, 255);
  static var bgColor =Colors.lime[100]!;
  static const btnColorDark = Color.fromARGB(255, 101, 101, 101);
  static const btnColorDark2 = Color.fromARGB(128, 255, 255, 255);
//implementation of backgroundGradient can bee see in main.dart
  static var backgroundGradient = LinearGradient(
    // Where the linear gradient begins and ends
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // Add one stop for each color. Stops should increase from 0 to 1
    stops: const [0.2, 0.4, 0.6, 0.7],
    // ignore: prefer_const_literals_to_create_immutables
    colors: [
      // Colors are easy thanks to Flutter's Colors class.
      Colors.lightBlue[100]!,
      Colors.lightGreen[50]!,
      Colors.red.shade100,
      Colors.lime[100]!,
    ],
  );
static var psgGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.blue.shade900,
      Colors.red.shade900,
    ],
);
  static var appbarGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.lightBlue[100]!,
     const Color.fromARGB(255, 199, 237, 254)
    ],
  );
}
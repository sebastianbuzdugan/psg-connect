// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psgfanboy/consts/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterTheme {
  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorPalette.blackColor,
    cardColor: ColorPalette.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorPalette.drawerColor,
      iconTheme: IconThemeData(
        color: ColorPalette.whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorPalette.drawerColor,
    ),
    primaryColor: ColorPalette.redColor,
    // ignore: deprecated_member_use
    backgroundColor: ColorPalette .drawerColor, // will be used as alternative background color

    
  );
    static TextTheme darkTextTheme = TextTheme(
    titleLarge: GoogleFonts.aBeeZee(
      color: ColorPalette.whiteColor,
      fontSize: 30,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: GoogleFonts.aBeeZee(
      color: ColorPalette.whiteColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: GoogleFonts.aBeeZee(
      color: ColorPalette.faithColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.aBeeZee(
      color: ColorPalette.faithColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ColorPalette.whiteColor,
    cardColor: ColorPalette.greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorPalette.whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: ColorPalette.blackColor,
      ),
    ),
    textTheme: lightTextTheme,
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorPalette.whiteColor,
    ),
    primaryColor: ColorPalette.redColor,
    // ignore: deprecated_member_use
    backgroundColor: ColorPalette.whiteColor,
  );

  static TextTheme lightTextTheme = TextTheme(
    titleLarge: GoogleFonts.aBeeZee(
      color: ColorPalette.blackColor,
      fontSize: 30,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: GoogleFonts.aBeeZee(
      color: ColorPalette.blackColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: GoogleFonts.aBeeZee(
      color: ColorPalette.greyColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.aBeeZee(
      color: ColorPalette.greyColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;
  ThemeNotifier({ThemeMode mode = ThemeMode.light})
      : _mode = mode,
        super(
          FlutterTheme.lightModeAppTheme,
        ) {
    getTheme();
  }

  ThemeMode get mode => _mode;

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'light') {
      _mode = ThemeMode.light;
      state = FlutterTheme.lightModeAppTheme;
    } else {
      _mode = ThemeMode.dark;
      state = FlutterTheme.darkModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = FlutterTheme.lightModeAppTheme;
      prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = FlutterTheme.darkModeAppTheme;
      prefs.setString('theme', 'dark');
    }
  }
}
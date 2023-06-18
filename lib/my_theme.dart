import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 152, 240, 130),
  primary: const Color.fromARGB(255, 206, 225, 210),
  background: Colors.grey.shade100,
);

class MyTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: kColorScheme,
    
    appBarTheme: AppBarTheme(backgroundColor: kColorScheme.primary),
    scaffoldBackgroundColor: kColorScheme.background,
  );
}

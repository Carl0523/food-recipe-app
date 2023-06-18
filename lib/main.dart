import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/my_theme.dart';
import 'package:meal_app/screens/tabs.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      home: const TabsScreen(),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/Viewer/mealviewer.dart';

import 'module/mealsType.dart';
import 'screens/StartingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Meal> favourite_meal = [];
    return MaterialApp(
      title: 'Food Court',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 228, 17, 158),
              brightness: Brightness.dark),
          textTheme: GoogleFonts.latoTextTheme(),
          scaffoldBackgroundColor: Colors.black),
      home: StartingPage(
        favourite_meal: favourite_meal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

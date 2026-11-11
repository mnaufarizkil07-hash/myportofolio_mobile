import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPortfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: const Color(0xFF122D70), // Biru gelap tema web
          secondary: const Color(0xFF56E1E8), // Cyan/Ice blue tema web
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
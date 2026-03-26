import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF005293),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF005293),
          foregroundColor: Color(0xFFFECB00),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
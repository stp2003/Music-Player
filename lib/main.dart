import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody_mate/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melody Mate',
      theme: ThemeData(
        fontFamily: 'poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

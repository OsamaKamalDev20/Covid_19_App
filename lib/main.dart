import 'package:covid19_app/colors/app_colors.dart';
import 'package:covid19_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: primaryBlack,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Covid19SplashScreen(),
    );
  }
}

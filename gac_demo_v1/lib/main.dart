import 'package:flutter/material.dart';
import 'package:gac_demo_v1/presentation/Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gac Demo',
      theme: ThemeData(
        fontFamily: 'gac'
      ),
      home: const SplashScreen(),
    );
  }
}

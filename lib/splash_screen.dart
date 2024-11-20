import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/sqflite_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  void start() {
    timer = Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const SqfliteScreen())));
  }

  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD32F2F),
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("assets/amit_logo.png"),
    );
  }
}

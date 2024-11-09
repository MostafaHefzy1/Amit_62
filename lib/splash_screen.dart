import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/login_screen.dart';

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
        () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginScreen())));
  }

  @override
  void initState() {
    start();
    super.initState();
  }


  @override
  void dispose() {
    timer.cancel() ; 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFC62828),
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("assets/amit_logo.png"),
    );
  }
}

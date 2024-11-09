import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen_two.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Screen One",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ScreenTwo()));
          },
          child: const Text("Navigator Screen 2"),
        ),
      ),
    );
  }
}

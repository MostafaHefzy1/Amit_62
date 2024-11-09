import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context) ; 
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            )),
        title: const Text(
          "Screen Two",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ThemeModeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text("Theme Mode Screen",
                style: Theme.of(context).textTheme.displayLarge!),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text("Theme Mode Screen",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 40,
                      // color: Colors.red
                    )),
          )
        ],
      ),
    );
  }
}

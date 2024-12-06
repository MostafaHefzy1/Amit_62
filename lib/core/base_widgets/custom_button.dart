import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function function;
  final bool loading;
  const CustomButton(
      {super.key,
      required this.text,
      required this.function,
      this.loading = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: () => function(),
        child: loading
            ? const Center(
                child: const CircularProgressIndicator(
                color: Colors.white,
              ))
            : Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
      ),
    );
  }
}

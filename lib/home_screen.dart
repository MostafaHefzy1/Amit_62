import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => LogicCubit(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Home Screen",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.deepOrange,
            ),
            body: Center(
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                           cubit.plusNumber();
                      },
                      child: const Text(
                        "Plus",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      )),
                  Text(
                    "${cubit.x}",
                    style: const TextStyle(color: Colors.black, fontSize: 34),
                  ),
                  TextButton(
                      onPressed: () {
                        cubit.minusNumber();
                      },
                      child: const Text(
                        "Minus",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      )),
                  // CircularProgressIndicator()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

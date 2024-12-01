import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown,
              title: const Text(
                "News App",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: cubit.screens[cubit.index],
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.brown,
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.index,
                onTap: (value) {
                  cubit.changeIndex(value);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.sports,
                      ),
                      label: "Sports"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.business,
                      ),
                      label: "Business"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.science,
                      ),
                      label: "Science")
                ]),
          );
        },
      ),
    );
  }
}

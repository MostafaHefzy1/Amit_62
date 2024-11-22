import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LogicCubit(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Login Screen",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.deepOrange,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Filed Is Required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: const Icon(Icons.email_outlined),
                          prefixIconColor: Colors.deepOrange[800],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: cubit.obscureText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Filed Is Required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIconColor: Colors.deepOrange[800],
                          hintText: "Password",
                          suffixIconColor: Colors.deepOrange[800],
                          suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeObscureText();
                              },
                              icon: Icon(cubit.icon)),
                          prefixIcon: const Icon(Icons.lock_open_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange,
                        ),
                        child: const Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/base_widgets/custom_text_form_filed.dart';
import 'package:flutter_application_1/core/helper/spacing.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
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
                "Login Screen",
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 24),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormFiled(
                        controller: phoneController,
                        hintText: "Phone",
                        prefixIcon: Icons.phone_android_sharp,
                        validator: (value) {}),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    const verticalSpace(
                      height: 10,
                    ),
                    CustomTextFormFiled(
                        controller: passwordController,
                        hintText: "Password",
                        prefixIcon: Icons.password,
                        suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeIconSuffix();
                            },
                            icon: Icon(cubit.iconDataSuffixIcon)),
                        validator: (value) {}),
                    // CustomTextFormFiled(
                    //     hintText: "Email",
                    //     prefixIcon: Icons.ac_unit_outlined,
                    //     suffixIcon: IconButton(
                    //         onPressed: () {}, icon: const Icon(Icons.lock))),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // TextFormField(
                    //   controller: phoneController,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "This value is Required";
                    //     }
                    //   },
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10)),
                    //     hintText: "Phone",
                    //     prefixIcon: const Icon(Icons.phone_android_outlined),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // TextFormField(
                    //   controller: passwordController,
                    //   obscureText: cubit.isObscureText,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "This value is Required";
                    //     }
                    //   },
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10)),
                    //       hintText: "Password",
                    //       prefixIcon: const Icon(Icons.lock_open_sharp),
                    // suffixIcon: IconButton(
                    //     onPressed: () {
                    //       cubit.changeIconSuffix();
                    //     },
                    //     icon: Icon(cubit.iconDataSuffixIcon))),
                    // ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        // if (formKey.currentState!.validate()) {
                        //   // cubit.resetPassword(
                        //   //   emailAddress: phoneController.text,
                        //   //   // password: passwordController.text
                        //   // );
                        // }
                        cubit.googleSignIn();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.yellow[700],
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        child: Center(
                            child: state is LoginLoadingState
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Logn In",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
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

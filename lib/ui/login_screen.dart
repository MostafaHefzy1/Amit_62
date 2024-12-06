import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/base_widgets/custom_app_bar.dart';
import 'package:flutter_application_1/core/base_widgets/custom_button.dart';
import 'package:flutter_application_1/core/base_widgets/custom_text_form_filed.dart';
import 'package:flutter_application_1/core/base_widgets/spacing.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_application_1/ui/forget_password.dart';
import 'package:flutter_application_1/ui/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            appBar: const CustomAppBar(title: "Logn In"),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  verticleSpace(20),
                  CustomTextFormFiled(
                      prefixIcon: Icons.email_outlined,
                      hintText: "Email",
                      validator: (value) {},
                      controller: cubit.emailController),
                  verticleSpace(5),
                  CustomTextFormFiled(
                      prefixIcon: Icons.lock,
                      hintText: "Password",
                      validator: (value) {},
                      controller: cubit.passwordController),
                  // verticleSpace(10),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const FoegetPasswordScreen()));
                        },
                        child: const Text(
                          "Forget Password ?",
                          style: TextStyle(color: Colors.brown, fontSize: 14),
                        )),
                  ),
                  CustomButton(
                    loading: state is LoginLoadingState,
                    text: "Logn In",
                    function: () {
                      cubit.login(context);
                    },
                  ),

                  verticleSpace(10),

                  Text.rich(
                    TextSpan(
                        text: "Dont Have Account? ",
                        style: TextStyle(fontSize: 14),
                        children: [
                          TextSpan(
                              text: "Click Here",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const RegisterScreen()));
                                })
                        ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

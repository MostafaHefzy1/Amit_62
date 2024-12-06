import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/base_widgets/custom_app_bar.dart';
import 'package:flutter_application_1/core/base_widgets/custom_button.dart';
import 'package:flutter_application_1/core/base_widgets/custom_text_form_filed.dart';
import 'package:flutter_application_1/core/base_widgets/spacing.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoegetPasswordScreen extends StatelessWidget {
  const FoegetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            appBar: const CustomAppBar(title: "Forget Password"),
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
                  verticleSpace(20),
                  CustomButton(
                    loading: state is ForgetPasswordLoadingState,
                    text: "ResetPassword",
                    function: () {
                      cubit.forgetPassword();
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

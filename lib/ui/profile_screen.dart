import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/base_widgets/custom_app_bar.dart';
import 'package:flutter_application_1/core/base_widgets/custom_button.dart';
import 'package:flutter_application_1/core/base_widgets/custom_text_form_filed.dart';
import 'package:flutter_application_1/core/base_widgets/spacing.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_application_1/ui/forget_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit()..getUser(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            body: cubit.userModel == null
                ? LinearProgressIndicator(
                  color: Colors.brown,
                )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        verticleSpace(20),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormFiled(
                                  prefixIcon: Icons.person_pin_sharp,
                                  hintText: "First Name",
                                  validator: (value) {},
                                  controller: cubit.firstNameController),
                            ),
                            horzinatalSpace(5),
                            Expanded(
                              child: CustomTextFormFiled(
                                  prefixIcon: Icons.person_pin_sharp,
                                  hintText: "Last Name",
                                  validator: (value) {},
                                  controller: cubit.lastNameController),
                            ),
                          ],
                        ),
                        verticleSpace(5),
                        CustomTextFormFiled(
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Email",
                            validator: (value) {},
                            controller: cubit.emailController),
                        verticleSpace(5),
                        CustomTextFormFiled(
                            keyboardType: TextInputType.number,
                            prefixIcon: Icons.phone_android_rounded,
                            hintText: "Phone",
                            validator: (value) {},
                            controller: cubit.phoneController),
                        verticleSpace(5),
                        CustomTextFormFiled(
                            prefixIcon: Icons.pin_drop_outlined,
                            hintText: "Adress",
                            validator: (value) {},
                            controller: cubit.addressController),
                        verticleSpace(10),
                        CustomButton(
                          loading: state is UpdateLoadingState,
                          text: "Update",
                          function: () {
                            cubit.updateUser();
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

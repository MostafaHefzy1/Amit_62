import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/local/shared_preferences_helper.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/ui/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicInitial());

  static LogicCubit get(context) {
    return BlocProvider.of(context);
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register(context) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      storeUser(value.user!.uid);
      SharedPreferencesHelper.saveData(key: "uid", value: value.user!.uid);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterFailedState());
    });
  }

  storeUser(String docID) {
    UserModel userModel = UserModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phone: phoneController.text,
        uId: docID,
        address: addressController.text);
    FirebaseFirestore.instance
        .collection("users")
        .doc(docID)
        .set(userModel.toJson())
        .then((value) {
      emit(SetUserSuccessState());
    }).catchError((error) {
      emit(SetUserFailedState());
    });
  }

  void login(context) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      log(value.user!.uid);
      SharedPreferencesHelper.saveData(key: "uid", value: value.user!.uid);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const ProfileScreen()));

      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  void forgetPassword() {
    emit(ForgetPasswordLoadingState());
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text)
        .then((value) {
      emit(ForgetPasswordSuccessState());
    }).catchError((error) {
      emit(ForgetPasswordFailedState());
    });
  }

  UserModel? userModel;
  getUser() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(SharedPreferencesHelper.getData(key: "uid"))
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);

      emailController.text = userModel!.email!;
      phoneController.text = userModel!.phone!;
      addressController.text = userModel!.address!;
      firstNameController.text = userModel!.firstName!;
      lastNameController.text = userModel!.lastName!;

      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserFailedState());
    });
  }

  updateUser() {
    emit(UpdateLoadingState());
    UserModel userModel = UserModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phone: phoneController.text,
        uId: SharedPreferencesHelper.getData(key: "uid"),
        address: addressController.text);
    FirebaseFirestore.instance
        .collection("users")
        .doc(SharedPreferencesHelper.getData(key: "uid"))
        .update(userModel.toJson())
        .then((value) {
      emit(UpdateSuccessState());
    }).catchError((error) {
      emit(UpdateFailedState());
    });
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/network/global/dio_helper.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/core/models/login_model.dart';
import 'package:flutter_application_1/screens/news/business_home_screen.dart';
import 'package:flutter_application_1/screens/news/science_home_screen%20copy.dart';
import 'package:flutter_application_1/screens/news/sports_home_screen.dart';
import 'package:flutter_application_1/core/models/news_model.dart';
import 'package:flutter_application_1/core/network/lcoal/sharedpref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicInitial());

  static LogicCubit get(context) {
    return BlocProvider.of(context);
  }

  // static LogicCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    SportsNewsHomeScreen(),
    BusinessHomeScreen(),
    const ScienceHomeScreen()
  ];

  int index = 0;
  void changeIndex(int value) {
    index = value;
    emit(EmitChangeIndex());
  }

  NewsModel? businessNewsModel;
  getArticalesBusiness() async {
    await DioHelper.getData(endpoint: "everything", queryParameters: {
      "language": "en",
      "q": "Business",
      "apiKey": "9bea17d1ed014375a4156ef51c6a8abe"
    }).then((value) {
      businessNewsModel = NewsModel.fromJson(value.data);
      emit(NewsArticleSuccessState());
    }).catchError((error) {
      emit(NewsArticleFailedState());
    });
  }

  NewsModel? newsModel;
  getArticales() async {
    await DioHelper.getData(endpoint: "everything", queryParameters: {
      "language": "en",
      "q": "sports",
      "apiKey": "9bea17d1ed014375a4156ef51c6a8abe"
    }).then((value) {
      newsModel = NewsModel.fromJson(value.data);
      emit(NewsArticleSuccessState());
    }).catchError((error) {
      emit(NewsArticleFailedState());
    });
  }

  NewsModel? scienceNewsModel;
  getSceience() async {
    await DioHelper.getData(endpoint: "everything", queryParameters: {
      "language": "en",
      "q": "science",
      "apiKey": "9bea17d1ed014375a4156ef51c6a8abe"
    }).then((value) {
      print("object $value");
      scienceNewsModel = NewsModel.fromJson(value.data);
      emit(NewsArticleSuccessState());
    }).catchError((error) {
      emit(NewsArticleFailedState());
    });
  }

  LoginModel? loginModel;
  void login(
      {required String phone,
      required String password,
      required BuildContext context}) {
    emit(LoginLoadingState());
    DioHelper.postData(
        endpoint: "auth/login",
        data: {"phone": phone, "password": password}).then((value) {
      log(value.data["access_token"]);
      loginModel = LoginModel.fromJson(value.data);
      SharedprefHelper.saveData(key: "token", value: loginModel!.accessToken!);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  bool isObscureText = true;
  IconData iconDataSuffixIcon = Icons.visibility_off_outlined;
  void changeIconSuffix() {
    isObscureText = !isObscureText;
    iconDataSuffixIcon = isObscureText
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ChangeSuffixIconState());
  }

  void createUser({
    required String emailAddress,
    required String password,
  }) async {
    emit(LoginLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        .then((value) {
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  void resetPassword({
    required String emailAddress,
  }) async {
    emit(LoginLoadingState());

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailAddress)
        .then((value) {
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  void googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      log("dsadsdsa${value.user!.email}");
      emit(GoogleSignInSuccessState());
    }).catchError((error) {
      emit(GoogleSignInFailedState());
    });
  }
}

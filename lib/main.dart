import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/bottom_nav_bar_screen.dart';
import 'package:flutter_application_1/core/bloc_observer/bloc_observer.dart';
import 'package:flutter_application_1/core/network/global/dio_helper.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/core/network/lcoal/sharedpref_helper.dart';
import 'package:flutter_application_1/screens/mmmm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDioHelper();
  Bloc.observer = MyBlocObserver();

  await SharedprefHelper.initSharedprefHelper();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false, home: LoginScreen());
      },
    );
  }
}

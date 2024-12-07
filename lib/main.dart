import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/bloc_observer/bloc_observer.dart';
import 'package:flutter_application_1/core/local/shared_preferences_helper.dart';
import 'package:flutter_application_1/core/notifications/notifications.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/ui/home_screen.dart';
import 'package:flutter_application_1/ui/login_screen.dart';
import 'package:flutter_application_1/ui/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await SharedPreferencesHelper.initSharedPreferencesHelper();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  FirebaseMessaging.instance.getToken().then((value) {
    log("${value}");
  });

  FirebaseNotifications.initFirebaseNotifications();
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,
    [
      NotificationChannel(
        channelKey: "firebase",
        channelName: "firebase",
        channelDescription: "notification for firebase",
        importance: NotificationImportance.High,
        playSound: true,
        channelShowBadge: true,
        enableVibration: true,
        enableLights: true,
      )
    ],
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
            debugShowCheckedModeBanner: false,
            home: SharedPreferencesHelper.getData(key: "uid") != null
                ? HomeScreen()
                : LoginScreen());
      },
    );
  }
}

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/carousel_slider.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/home_sqflite.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:flutter_application_1/review.dart';
import 'package:flutter_application_1/routing/app_router.dart';
import 'package:flutter_application_1/screen_one.dart';
import 'package:flutter_application_1/shared_helper.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:flutter_application_1/theme_mode.dart';
import 'package:flutter_application_1/widgets_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   runApp(ErrorWidgetClass(details));
  // };
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initSharedPreferences();

  // // SharedPreferencesHelper.saveData(key: "key", value: "Messi");

  // // print(SharedPreferencesHelper.getData(key: "key"));

  // print(SharedPreferencesHelper.getData(key: "key"));

  // SharedPreferencesHelper.removeData(key: "key");
  // print(SharedPreferencesHelper.getData(key: "key"));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //       appBarTheme: const AppBarTheme(
    //           systemOverlayStyle: SystemUiOverlayStyle(
    //     systemStatusBarContrastEnforced: true,
    //     systemNavigationBarContrastEnforced: true,
    //     statusBarColor: Colors.green,
    //     systemNavigationBarColor: Colors.green,
    //     systemNavigationBarDividerColor:   Color(0xFFC62828),
    //   ))),
    //   home: SplashScreen(),
    // );
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    actionsIconTheme: IconThemeData(color: Colors.black)),
                scaffoldBackgroundColor: Colors.white,
                textTheme: const TextTheme(
                  displayLarge: TextStyle(color: Colors.red, fontSize: 22),
                  displayMedium: TextStyle(color: Colors.black, fontSize: 20),
                )),
            darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black,
                    actionsIconTheme: IconThemeData(color: Colors.white)),
                scaffoldBackgroundColor: Colors.black,
                textTheme: const TextTheme(
                  displayLarge: TextStyle(color: Colors.red, fontSize: 22),
                  displayMedium: TextStyle(color: Colors.white, fontSize: 20),
                )),
            themeMode: SharedPreferencesHelper.getData(key: "isDark") == true
                ? ThemeMode.light
                : ThemeMode.dark,
            home: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isDark = !isDark;

                          // print("isDark $isDark");
                        });
                        SharedPreferencesHelper.saveData(
                            key: "isDark", value: isDark);
                        print(
                            "isDark ${SharedPreferencesHelper.getData(key: "isDark")}");
                      },
                      icon: Icon(Icons.dark_mode))
                ],
              ),
            ),
          );
        });
  }
}

class ErrorWidgetClass extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const ErrorWidgetClass(this.errorDetails, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Custom Error",
      home: Scaffold(
          body: Center(
        child: Text(
          errorDetails.exceptionAsString(),
          textAlign: TextAlign.center,
          style: const TextStyle(),
        ),
      )),
    );
  }
}

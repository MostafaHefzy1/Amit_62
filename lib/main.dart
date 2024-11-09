import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/home_sqflite.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:flutter_application_1/routing/app_router.dart';
import 'package:flutter_application_1/screen_one.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:flutter_application_1/widgets_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   runApp(ErrorWidgetClass(details));
  // };
  runApp(MyApp()
      // DevicePreview(
      //     enabled: !kReleaseMode,
      //     builder: (context) => const MyApp()), // Wrap your app
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            // routes: {
            //   '/': (context) => SplashScreen(),
            //   '/loginScreen': (context) => LoginScreen(),
            //   // '/loginScreen': (context) => LoginScreen(),
            // },
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            // theme: ThemeData(
            //     appBarTheme: const AppBarTheme(
            //         systemOverlayStyle: SystemUiOverlayStyle(
            //   systemStatusBarContrastEnforced: true,
            //   systemNavigationBarContrastEnforced: true,
            //   statusBarColor: Colors.green,
            //   systemNavigationBarColor: Colors.green,
            //   systemNavigationBarDividerColor: Color(0xFFC62828),
            // ))),
            home: SplashScreen(),
            // initialRoute: Routes.splashScreen,
            // onGenerateRoute: RouteGenerator.getRoute,
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

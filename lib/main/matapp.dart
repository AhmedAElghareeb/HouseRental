import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project/widgets/hexacolor.dart';
import 'package:final_project/main.dart';
import 'package:final_project/user_screens/home.dart';
import 'package:final_project/user_screens/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor("FFFFFF"),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Center(
            child: Image.asset("assets/app_logo/logoo.jpeg"),
          ),
        nextScreen: (data.getString("email") == null) ? LoginScreen() : Home(),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: 250,
        animationDuration: Duration(seconds: 1,),
        duration: 1000,
        backgroundColor: HexColor("FFFFFF"),
      ),
    );
  }
}
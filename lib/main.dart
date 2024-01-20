import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project/widgets/hexacolor.dart';
import 'package:final_project/user_screens/home.dart';
import 'package:final_project/user_screens/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

late SharedPreferences data;
late Database mydb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  mydb = await openDatabase(
    "house_rental.db",
    version: 1,
    onCreate: (db, version) {
      db.execute(
        "CREATE TABLE Items (description VARCHAR (1000), price VARCHAR(5000), location VARCHAR(5000), photo1 VARCHAR(500), photo2 VARCHAR(500), photo3 VARCHAR(500), facebook VARCHAR(200), sms VARCHAR(200), whatsapp VARCHAR(30), call VARCHAR(30), lat DOUBLE, long DOUBLE)",
      );
    },
  );

  data = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        animationDuration: const Duration(
          seconds: 1,
        ),
        duration: 1000,
        backgroundColor: HexColor("FFFFFF"),
      ),
    );
  }
}

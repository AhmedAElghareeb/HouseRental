import 'package:final_project/main/matapp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences data;


Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  data = await SharedPreferences.getInstance();


  runApp(MyApp());
}
import 'package:final_project/main/matapp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';



late SharedPreferences data;
late Database mydb;


Future<void> main()
async {
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

  runApp(MyApp());
}
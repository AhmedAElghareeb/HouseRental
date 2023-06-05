import 'package:final_project/admin/admin_login.dart';
import 'package:final_project/hexacolor.dart';
import 'package:final_project/main/main.dart';
import 'package:final_project/screens/home.dart';
import 'package:final_project/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget
{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController email = new TextEditingController();

  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor("FFFFFF"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Image.asset("assets/logoo.jpeg", width: 200, height: 200,),
          SizedBox(height: 25.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 25.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Enter Your E-Mail",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              cursorColor: Colors.black,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 35.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                elevation: 0.0,
                height: 40.0,
                minWidth: 150.0,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000.0),
                ),
                color: Colors.black,
                onPressed: ()
                async {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text.trim(),
                      password: password.text.trim(),
                  );
                  data.setString("email", email.text.toString());
                  data.setString("password", password.text.toString());
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Home(),
                  ),);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Have an Account?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 15,),
              MaterialButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000.0),
                ),
                color: Colors.black,
                onPressed: ()
                {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                  ),);
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 45.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.black,
                elevation: 0.0,
                height: 40,
                minWidth: 180,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000.0),
                ),
                onPressed: ()
                {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => AdminLogin()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person_pin_sharp,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      "Login As Admin?",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:final_project/widgets/hexacolor.dart';
import 'package:final_project/user_screens/home.dart';
import 'package:final_project/user_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpScreen extends StatefulWidget
{
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = new TextEditingController();

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
          Image.asset("assets/app_logo/logoo.jpeg", width: 200, height: 200,),
          SizedBox(height: 25.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
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
              controller: name,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Enter Your Name",
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
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ),
          SizedBox(height: 15.0,),
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
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
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
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
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
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email.text.trim(),
                      password: password.text.trim(),
                  );
                  CircularProgressIndicator();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (route) => route.isCurrent
                  );
                },
                child: Text(
                  "Sign Up",
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
                "Have an Account?",
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
                  CircularProgressIndicator();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => route.isCurrent
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
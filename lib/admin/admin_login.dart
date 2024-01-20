import 'package:final_project/admin/admin_home.dart';
import 'package:final_project/widgets/hexacolor.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AdminLogin extends StatefulWidget
{
  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin>
{
  TextEditingController adminemail = new TextEditingController();
  TextEditingController adminpassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor("FFFFFF"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children:
        [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Hello Admin",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Image.asset("assets/app_logo/hi.png", width: 150, height: 150,),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: adminemail,
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
                  onChanged: (value)
                  {
                    value = adminpassword.text;
                  },
                  controller: adminpassword,
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
              SizedBox(height: 15.0,),
              MaterialButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(1000.0),
                    bottomRight: Radius.circular(1000.0),
                  ),
                ),
                elevation: 0.0,
                height: 40.0,
                minWidth: 150,
                color: Colors.black,
                onPressed: () async {
                     await FirebaseAuth.instance.signInWithEmailAndPassword(
                       email: adminemail.text.trim(),
                       password: adminpassword.text.trim(),
                     );
                     data.setString("adminemail", adminemail.text.toString());
                     data.setString("adminpassword", adminpassword.text.toString());
                     if (adminpassword.text == "admin1234")
                     {
                       CircularProgressIndicator();
                       Navigator.pushAndRemoveUntil(
                           context, MaterialPageRoute(
                           builder: (context) => AdminHome()), (route) => route.isCurrent
                       );
                     }
                     },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18.0,
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
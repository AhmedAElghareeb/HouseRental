import 'package:final_project/admin/admin_home.dart';
import 'package:final_project/widgets/hexacolor.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController adminEmail = TextEditingController();
  TextEditingController adminPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor("FFFFFF"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "Hello Admin",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/app_logo/hi.png",
                      width: 150,
                      height: 150,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: adminEmail,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Enter Your E-Mail",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    value = adminPassword.text;
                  },
                  controller: adminPassword,
                  cursorColor: Colors.black,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              MaterialButton(
                shape: const OutlineInputBorder(
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
                    email: adminEmail.text.trim(),
                    password: adminPassword.text.trim(),
                  );
                  data.setString("adminemail", adminEmail.text.toString());
                  data.setString(
                      "adminpassword", adminPassword.text.toString());
                  if (adminPassword.text == "admin1234") {
                    const CircularProgressIndicator();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => AdminHome()),
                        (route) => route.isCurrent);
                  }
                },
                child: const Text(
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

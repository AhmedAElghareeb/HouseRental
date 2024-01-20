import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/admin/one_item_info.dart';
import 'package:final_project/widgets/hexacolor.dart';
import 'package:final_project/user_screens/login_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget
{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor("FFFFFF"),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: HexColor("FFFFFF"),
        title: const Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: ()
            {
              Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(
                  builder: (context) => LoginScreen()), (route) => route.isCurrent
              );
            },
            icon: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("Items").get(),
        builder: (context, AsyncSnapshot snapshot)
        {
          if (snapshot.hasData == true)
          {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index)
                {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OneItemInfo(
                        snapshot.data.docs[index]["description"],
                        snapshot.data.docs[index]["price"],
                        snapshot.data.docs[index]["location"],
                        snapshot.data.docs[index]["photo1"],
                        snapshot.data.docs[index]["photo2"],
                        snapshot.data.docs[index]["photo3"],
                        snapshot.data.docs[index]["facebook"],
                        snapshot.data.docs[index]["sms"],
                        snapshot.data.docs[index]["whatsapp"],
                        snapshot.data.docs[index]["call"],
                        snapshot.data.docs[index]["lat"],
                        snapshot.data.docs[index]["long"],
                      ),
                    ],
                  );
                });
          } else
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          },
      ),
    );
  }
}
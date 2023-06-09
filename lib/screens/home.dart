import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/admin/one_item_info.dart';
import 'package:final_project/hexacolor.dart';
import 'package:final_project/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor("FFFFFF"),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: HexColor("FFFFFF"),
        title: Text(
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
            icon: Icon(
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
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index)
                {
                  return OneItemInfo(
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
                  );
                });
          } else
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          },
      ),
    );
  }
}
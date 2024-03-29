import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/admin/add_new.dart';
import 'package:final_project/admin/one_item_info.dart';
import 'package:final_project/widgets/hexacolor.dart';
import 'package:final_project/user_screens/login_screen.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget
{
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor("FFFFFF"),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: HexColor("FFFFFF"),
        title: const Text(
          "Admin Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: ()
            {
              const CircularProgressIndicator();
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: ()
        {
          const CircularProgressIndicator();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AddNew()), (route) => route.isFirst
          );
        },
        child: const Icon(Icons.add, color: Colors.white,),
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
                        snapshot.data.docs[index]["facebook"],
                        snapshot.data.docs[index]["sms"],
                        snapshot.data.docs[index]["whatsapp"],
                        snapshot.data.docs[index]["call"],
                        snapshot.data.docs[index]["lat"].toString(),
                        snapshot.data.docs[index]["long"].toString(),
                        snapshot.data.docs[index]["imageUrl"],
                      ),
                      IconButton(
                        onPressed: () async {
                          await deleteItem(snapshot.data.docs[index].id);
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) => const AdminHome()), (route) => route.isCurrent);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
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

  Future<void> deleteItem(id)
  async {
    FirebaseFirestore
        .instance
        .collection("Items")
        .doc(id)
        .delete();
  }
}
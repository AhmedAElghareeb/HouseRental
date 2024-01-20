import 'package:final_project/admin/one_item_info.dart';
import 'package:final_project/widgets/hexacolor.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor("FFFFFF"),
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        elevation: 0.0,
        backgroundColor: HexColor("FFFFFF"),
        title: Text(
          "Your Favourites",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
        future: mydb.query("Items"),
        builder: (context, AsyncSnapshot snapshot)
        {
          if (snapshot.hasData == true)
          {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index)
                {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OneItemInfo(
                        snapshot.data[index]["description"],
                        snapshot.data[index]["price"],
                        snapshot.data[index]["location"],
                        snapshot.data[index]["photo1"],
                        snapshot.data[index]["photo2"],
                        snapshot.data[index]["photo3"],
                        snapshot.data[index]["facebook"],
                        snapshot.data[index]["sms"],
                        snapshot.data[index]["whatsapp"],
                        snapshot.data[index]["call"],
                        snapshot.data[index]["lat"],
                        snapshot.data[index]["long"],
                      ),
                    ],
                  );
                }
            );
          }
          else
          {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
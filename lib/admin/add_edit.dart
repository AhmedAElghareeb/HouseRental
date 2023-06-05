import 'package:final_project/admin/add_new.dart';
import 'package:final_project/admin/admin_home.dart';
import 'package:final_project/hexacolor.dart';
import 'package:flutter/material.dart';

class AddEdit extends StatefulWidget
{
  @override
  State<AddEdit> createState() => _AddEditState();
}

class _AddEditState extends State<AddEdit> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        backgroundColor: HexColor("FFFFFF"),
        elevation: 0.0,
      ),
      backgroundColor: HexColor("FFFFFF"),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
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
                  Image.asset("assets/hi.png", width: 150, height: 150,),
                ],
              ),
              SizedBox(height: 100.0,),
              MaterialButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(1000.0),
                    bottomRight: Radius.circular(1000.0),
                  ),
                ),
                elevation: 0.0,
                color: Colors.black,
                onPressed: ()
                {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => AddNew()));
                },
                child: Text(
                  "Add New Appartment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(height: 15.0,),
              MaterialButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(1000.0),
                    bottomLeft: Radius.circular(1000.0),
                  ),
                ),
                elevation: 0.0,
                color: Colors.black,
                onPressed: ()
                {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Edit()));
                },
                child: Text(
                  "Edit Appartment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
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
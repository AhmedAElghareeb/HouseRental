import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/admin/admin_home.dart';
import 'package:final_project/admin/item_info.dart';
import 'package:final_project/hexacolor.dart';
import 'package:final_project/main/main.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class AddNew extends StatefulWidget
{
  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew>
{
  TextEditingController des = new TextEditingController();
  TextEditingController pri = new TextEditingController();
  TextEditingController loc = new TextEditingController();
  TextEditingController pic = new TextEditingController();
  TextEditingController facebook = new TextEditingController();
  TextEditingController sms = new TextEditingController();
  TextEditingController whatsapp = new TextEditingController();
  TextEditingController call = new TextEditingController();
  TextEditingController lat=new TextEditingController();
  TextEditingController long=new TextEditingController();

  late dynamic z;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
      ),
      backgroundColor: HexColor("FFFFFF"),
      body: ListView(
        physics:  BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To Add New Photo (assets/name of photo.extention!!!)",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: des,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Description",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: pri,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Price Per Month",
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: loc,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Location",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: pic,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Picture",
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: facebook,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Facebook Name",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: sms,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Message Number same as Phone Number",
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: whatsapp,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "WhatsApp Number",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: call,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Phone Number for Calling",
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    setState(() async {
                      Location _location =new Location();
                      dynamic _direction=await _location.getLocation();
                      double _latt=_direction.latitude;
                      double _longg=_direction.longitude;


                    String description = des.text;
                    String price  = pri.text;
                    String location = loc.text;
                    String photo = pic.text;
                    String face = facebook.text;
                    String sm = sms.text;
                    String whats = whatsapp.text;
                    String cal = call.text;


                    FirebaseFirestore.instance.collection("Items").add(
                        <String, dynamic> {
                          "description" : description,
                          "price" : price,
                          "location" : location,
                          "photo" : photo,
                          "facebook" : face,
                          "sms" : sm,
                          "whatsapp" : whats,
                          "call" : cal,
                          "lat":_latt,
                          "long":_longg,
                        }
                    );
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => AdminHome()));
                    });
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
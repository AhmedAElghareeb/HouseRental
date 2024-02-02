import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/admin/admin_home.dart';
import 'package:final_project/widgets/hexacolor.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  TextEditingController des = TextEditingController();
  TextEditingController pri = TextEditingController();
  TextEditingController loc = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController sms = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController call = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController long = TextEditingController();
  TextEditingController imageName = TextEditingController();
  String imageUrl = "";
  File? img;
  String? image;
  dynamic picker = ImagePicker();

  Future<void> uploadImage() async {
    // Reference referenceRoot = FirebaseStorage.instance.ref();
    // Reference referenceDirectionImages = referenceRoot.child(
    //   "images",
    // );
    // Reference referenceImageToUpload = referenceDirectionImages.child(
    //   imageName.text.toString(),
    // );
    //
    // await referenceImageToUpload.putFile(
    //   File(
    //     img!.path,
    //   ),
    // );
    //
    // imageUrl = await referenceImageToUpload.getDownloadURL();

    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child("image_${des.text}.jpg");
    final mountainImagesRef = storageRef.child("images/image_${des.text}.jpg");
    assert(mountainsRef.name == mountainImagesRef.name);
    assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
    File file = File(img!.path);
    await mountainsRef.putFile(file);
    imageUrl = await mountainsRef.getDownloadURL();

  }

  Future<void> pickImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      setState(() {
        img = File(xFile.path);
      });
    }
  }

  Future<void> pickCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (xFile != null) {
      setState(() {
        img = File(xFile.path);
      });
    }
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text('أختر الصورة الشخصية'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  pickImage();
                  Navigator.pop(context);
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.blue,
                    ),
                    Text(
                      'المعرض',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              InkWell(
                onTap: () {
                  pickCamera();
                  Navigator.pop(context);
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 80,
                    ),
                    Text(
                      'الكاميرا',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: HexColor("FFFFFF"),
      ),
      backgroundColor: HexColor("FFFFFF"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
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
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
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
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
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
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => bottomSheet(context),
                );
              });
            },
            child: Text(
              "Choose",
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
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
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
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
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
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
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
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
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
                  shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(1000.0),
                      bottomLeft: Radius.circular(1000.0),
                    ),
                  ),
                  elevation: 0.0,
                  color: Colors.black,
                  onPressed: () {
                    setState(() async {
                      Location _location = Location();
                      dynamic _direction = await _location.getLocation();
                      double _latt = _direction.latitude;
                      double _longg = _direction.longitude;

                      String description = des.text;
                      String price = pri.text;
                      String location = loc.text;
                      String face = facebook.text;
                      String sm = sms.text;
                      String whats = whatsapp.text;
                      String cal = call.text;
                      await uploadImage();

                      FirebaseFirestore.instance
                          .collection("Items")
                          .add(<String, dynamic>{
                        "description": description,
                        "price": price,
                        "location": location,
                        "facebook": face,
                        "sms": sm,
                        "whatsapp": whats,
                        "call": cal,
                        "lat": _latt,
                        "long": _longg,
                        "imageUrl": imageUrl
                      });

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => AdminHome()),
                          (route) => route.isCurrent);
                    });
                  },
                  child: const Text(
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

import 'package:final_project/hexacolor.dart';
import 'package:final_project/map/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class ItemInfo extends StatefulWidget
{
  late String des, pri, loc, facebook, sms, whatsapp, call;
  late double lat,long;
  dynamic img1, img2, img3;

  ItemInfo(
      this.des,
      this.pri,
      this.loc,
      this.img1,
      this.img2,
      this.img3,
      this.facebook,
      this.sms,
      this.whatsapp,
      this.call,
      this.lat,
      this.long,
      );

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Appartment Information",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            child: ListView(
              padding: EdgeInsets.all(10.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Image.asset(widget.img1, width: 300, height: 200,),
                Image.asset(widget.img2, width: 300, height: 200,),
                Image.asset(widget.img3, width: 300, height: 200,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Description: ${widget.des}", style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Text("Location: ${widget.loc}", style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Price: ${widget.pri} LE Per Month", style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: ()
                {
                  launch("https://www.facebook.com/${widget.facebook}/");
                }, icon: Icon(Icons.facebook)),
                SizedBox(width: 20.0,),
                IconButton(onPressed: ()
                {
                  launch("sms: +2${widget.sms}");
                }, icon: Icon(Icons.message)),
                SizedBox(width: 20.0,),
                IconButton(onPressed: ()
                {
                  launch("https://wa.me/+2${widget.whatsapp}/");
                }, icon: Icon(Icons.telegram_rounded)),
                SizedBox(width: 20.0,),
                IconButton(onPressed: ()
                {
                  FlutterPhoneDirectCaller.callNumber("+2${widget.call}");
                }, icon: Icon(Icons.call)),
                SizedBox(width: 20.0,),
                IconButton(onPressed: ()
                {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => MapScreen(widget.lat,widget.long),),);
                }, icon: Icon(Icons.my_location)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
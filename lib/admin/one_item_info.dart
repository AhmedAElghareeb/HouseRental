import 'package:final_project/admin/item_info.dart';
import 'package:flutter/material.dart';

class OneItemInfo extends StatefulWidget
{
  String des, pri, loc, facebook, sms, whatsapp, call;
  double lat,long;
  dynamic img1, img2, img3;

  OneItemInfo(this.des, this.pri, this.loc, this.img1, this.img2, this.img3,  this.facebook, this.sms, this.whatsapp, this.call,this.lat,this.long);

  @override
  State<OneItemInfo> createState() => _OneItemInfoState();
}

class _OneItemInfoState extends State<OneItemInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => ItemInfo(
              widget.des,
              widget.pri,
              widget.loc,
              widget.img1,
              widget.img2,
              widget.img3,
              widget.facebook,
              widget.sms,
              widget.whatsapp,
              widget.call,
              widget.lat,
              widget.long
            ),
        ),);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(widget.img1, width: 150, height: 150,),
              SizedBox(width: 10.0,),
              Column(
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      widget.loc,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "${widget.pri} EGP per month!!",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
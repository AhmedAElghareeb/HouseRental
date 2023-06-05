import 'package:final_project/admin/item_info.dart';
import 'package:flutter/material.dart';

class OneItemInfo extends StatelessWidget
{
  String des, pri, loc, facebook, sms, whatsapp, call;
  double lat,long;
  dynamic img;

  OneItemInfo(this.des, this.pri, this.loc, this.img, this.facebook, this.sms, this.whatsapp, this.call,this.lat,this.long);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => ItemInfo(
              des,
              pri,
              loc,
              img,
              facebook,
              sms,
              whatsapp,
              call,
              lat,
              long
            ),
        ),);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img, width: 150, height: 150,),

              SizedBox(width: 10.0,),
              Column(
                children: [
                  Text(
                    des,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Text(
                    "${pri} LE per month!!",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
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
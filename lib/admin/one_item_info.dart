import 'package:final_project/admin/item_info.dart';
import 'package:flutter/material.dart';

class OneItemInfo extends StatefulWidget {
  String des, pri, loc, facebook, sms, whatsapp, call;
  String lat, long;
  String imageUrl = "";

  OneItemInfo(
    this.imageUrl,
    this.des,
    this.pri,
    this.loc,
    this.facebook,
    this.sms,
    this.whatsapp,
    this.call,
    this.lat,
    this.long,
  );

  @override
  State<OneItemInfo> createState() => _OneItemInfoState();
}

class _OneItemInfoState extends State<OneItemInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemInfo(
              widget.des,
              widget.pri,
              widget.loc,
              widget.facebook,
              widget.sms,
              widget.whatsapp,
              widget.call,
              widget.lat,
              widget.long,
              widget.imageUrl,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.network(
                  widget.imageUrl.toString(),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
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
                  SizedBox(
                    height: 10.0,
                  ),
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
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

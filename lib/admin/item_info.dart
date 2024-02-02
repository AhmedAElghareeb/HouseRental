import 'package:final_project/widgets/hexacolor.dart';
import 'package:final_project/map/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ItemInfo extends StatefulWidget {
  late String des, pri, loc, facebook, sms, whatsapp, call;
  late String lat, long;
  String imageUrl = "";

  ItemInfo(
    this.des,
    this.pri,
    this.loc,
    this.facebook,
    this.sms,
    this.whatsapp,
    this.call,
    this.lat,
    this.long,
    this.imageUrl,
  );

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: const Text(
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
          SizedBox(
            height: 250,
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                    width: 300,
                    height: 200,
                    child: Image.network(widget.imageUrl.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Description: ${widget.des}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Text(
              "Location: ${widget.loc}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Price: ${widget.pri} EGP Per Month",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      launch("https://www.facebook.com/${widget.facebook}/");
                    },
                    icon: const Icon(Icons.facebook)),
                const SizedBox(
                  width: 20.0,
                ),
                IconButton(
                    onPressed: () {
                      launch("sms: +2${widget.sms}");
                    },
                    icon: const Icon(Icons.message)),
                const SizedBox(
                  width: 20.0,
                ),
                IconButton(
                    onPressed: () {
                      launch("https://wa.me/+2${widget.whatsapp}/");
                    },
                    icon: const Icon(Icons.telegram_rounded)),
                const SizedBox(
                  width: 20.0,
                ),
                IconButton(
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber("+2${widget.call}");
                    },
                    icon: const Icon(Icons.call)),
                const SizedBox(
                  width: 20.0,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapScreen(
                              double.parse(widget.lat.toString()),
                              double.parse(widget.long.toString())),
                        ),
                      );
                    },
                    icon: const Icon(Icons.my_location)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

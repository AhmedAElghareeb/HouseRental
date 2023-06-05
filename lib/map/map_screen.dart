import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatelessWidget
{
  late double a, b;
 // late String name;

  MapScreen(this.a, this.b);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {},
        initialCameraPosition: CameraPosition(
          target: LatLng(a, b),
          zoom: 10.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId(
                "123",
            ),
            position: LatLng(a, b),
            // infoWindow: InfoWindow(
            //   title: name,
            // ),
          ),
        },
      ),
    );
  }
}
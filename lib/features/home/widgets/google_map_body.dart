import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapBody extends StatefulWidget {
  const GoogleMapBody({super.key});

  @override
  State<GoogleMapBody> createState() => _GoogleMapBodyState();
}

class _GoogleMapBodyState extends State<GoogleMapBody> {
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initialCameraPosition = 
    const CameraPosition(
      zoom: 14,
      target: LatLng(30.01674904968964, 31.187139610564778));
    super.initState();
  }
  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          initialCameraPosition: initialCameraPosition,
          // for full controller on google map
          onMapCreated: (controller) {
          googleMapController = controller;
          },
        ),
        Positioned(
          bottom: 16,
          left: 40,
          right: 80,
          child: ElevatedButton(
            onPressed: () 
            {
              // create new location for used this location by onPressed
              CameraPosition newLocation = const CameraPosition(
                target: LatLng(30.039908977332246, 31.217966571099677),
                zoom: 16,);
              // moved dynamic to new location from (animatedCamera)
              googleMapController.animateCamera(CameraUpdate.newCameraPosition(newLocation));
            }, 
            child: Text('Change Location'),
          ),
        ),
      ]
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_tracking/features/home/widgets/custom_button_sheet.dart';

class GoogleMapBody extends StatefulWidget {
  const GoogleMapBody({super.key});

  @override
  State<GoogleMapBody> createState() => _GoogleMapBodyState();
}

class _GoogleMapBodyState extends State<GoogleMapBody> {
  late GoogleMapController mapController;

  Set<Marker> markers = {};
  List<Map<String, dynamic>> devices = [];

  @override
  void initState() {
    super.initState();
    generateFakeDevices();
    generateMarkers();
  }

  void generateFakeDevices() {
    devices = List.generate(20, (index) {
      return {
        "id": index,
        "name": "Device ${index + 1}",
        "status": index % 2 == 0 ? "online" : "offline",
        "lat": 30.0 + index * 0.002,
        "lng": 31.0 + index * 0.002,
      };
    });
  }

  void generateMarkers() {
    for (var device in devices) {
      markers.add(
        Marker(
          markerId: MarkerId(device["id"].toString()),
          position: LatLng(device["lat"], device["lng"]),
          infoWindow: InfoWindow(title: device["name"]),
        ),
      );
    }
  }

  void moveToDevice(Map<String, dynamic> device) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(device["lat"], device["lng"]), zoom: 17),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(30.0, 31.0),
              zoom: 12,
            ),
            markers: markers,
            onMapCreated: (controller) {
              mapController = controller;
            },
          ),

          // زرار الشيت
          Positioned(
            bottom: 20,
            left: 20,
            child: CustomButtonSheet(
              devices: devices,
              onSelectDevice: moveToDevice,
            ),
          ),
        ],
      ),
    );
  }
}

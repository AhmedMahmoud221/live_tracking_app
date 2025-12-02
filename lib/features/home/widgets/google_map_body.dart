import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_tracking/features/auth/models/device_model.dart';
import 'package:live_tracking/features/home/widgets/custom_button_sheet.dart';

class GoogleMapBody extends StatefulWidget {
  const GoogleMapBody({super.key});

  @override
  State<GoogleMapBody> createState() => _GoogleMapWithSheetState();
}

class _GoogleMapWithSheetState extends State<GoogleMapBody> {
  GoogleMapController? mapController;

  final DraggableScrollableController sheetController =
    DraggableScrollableController();

  List<DeviceModel> devices = [
    DeviceModel(
      name: "Device 1",
      status: "online",
      lat: 30.0444,
      lng: 31.2357,
    ),
    DeviceModel(
      name: "Device 2",
      status: "offline",
      lat: 29.956,
      lng: 30.912,
    ),
    DeviceModel(
      name: "Device 3",
      status: "offline",
      lat: 29.956,
      lng: 30.912,
    ),
    DeviceModel(
      name: "Device 4",
      status: "offline",
      lat: 29.956,
      lng: 30.912,
    ),
  ];

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    addMarkers();
  }

  void addMarkers() {
    markers.clear();
    for (var d in devices) {
      markers.add(
        Marker(
          markerId: MarkerId(d.name),
          position: LatLng(d.lat, d.lng),
          infoWindow: InfoWindow(title: d.name),
        ),
      );
    }
    setState(() {});
  }

  void zoomToDevice(DeviceModel device) {
    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(device.lat, device.lng),
        14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //---------- Google Map ----------//
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(30.0444, 31.2357),  // cairo
              zoom: 14,
            ),
            markers: markers,
            onMapCreated: (controller) => mapController = controller,
          ),
          //------------ Button Sheet --------------//
          CustomButtonSheet(
            devices: devices,
            onSelectDevice: zoomToDevice,
            sheetController: sheetController,
          ),
        ],
      ),
    );
  }
}

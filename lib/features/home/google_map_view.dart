import 'package:flutter/material.dart';
import 'package:live_tracking/features/home/drawer/custom_drawer.dart';
import 'package:live_tracking/features/home/widgets/google_map_body.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      drawer: const CustomDrawer(),
      appBar: buildAppBar(context),
      body: const GoogleMapBody(),
    );
  }


  AppBar? buildAppBar(BuildContext context) {
    return MediaQuery.sizeOf(context).width -32 <900 ?  AppBar(
            backgroundColor: const Color.fromARGB(255, 36, 131, 255),
            leading: GestureDetector(
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.menu, size: 30),
                onPressed: () {
                  ScaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
          )
          : null;
  }
}
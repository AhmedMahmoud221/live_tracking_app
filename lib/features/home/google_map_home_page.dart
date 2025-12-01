import 'package:flutter/material.dart';
import 'package:live_tracking/features/home/drawer/custom_drawer.dart';
import 'package:live_tracking/features/home/widgets/CustomAppbar.dart';
import 'package:live_tracking/features/home/widgets/google_map_body.dart';

class GoogleMapHomePage extends StatefulWidget {
  const GoogleMapHomePage({super.key});

  @override
  State<GoogleMapHomePage> createState() => _GoogleMapHomePageState();
}

class _GoogleMapHomePageState extends State<GoogleMapHomePage> {
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


  PreferredSizeWidget buildAppBar(BuildContext context) {
    return CustomAppbar(ScaffoldKey: ScaffoldKey);
  }

}


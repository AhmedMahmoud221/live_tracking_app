import 'package:flutter/material.dart';
import 'package:live_tracking/features/home/drawer/widgets/google_map_page.dart';

class GoogleMapHomePage extends StatelessWidget {
  const GoogleMapHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoogleMapAppbar(),
      ],
    );
  }
}
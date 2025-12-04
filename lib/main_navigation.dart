import 'package:flutter/material.dart';
import 'package:live_tracking/custom_bottom_bar.dart';
import 'package:live_tracking/profile_page.dart';
import 'google_map_home_page.dart';
import 'devices_page.dart';
import 'notification_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    GoogleMapHomePage2(),
    DevicesPage(),
    LiveTrackingPage(),
    ProfilePage(),
  ];

  final List<String> titles = const [
    "Live Tracking",
    "Devices",
    "Live Tracking",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          titles[selectedIndex],
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

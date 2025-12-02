// import 'package:flutter/material.dart';
// import 'package:live_tracking/features/home/drawer/custom_drawer.dart';
// import 'package:live_tracking/features/home/widgets/custom_buttom_bar.dart';
// import 'package:live_tracking/features/home/widgets/google_map_body.dart';

// class GoogleMapHomePage extends StatefulWidget {
//   const GoogleMapHomePage({super.key});

//   @override
//   State<GoogleMapHomePage> createState() => _GoogleMapHomePageState();
// }

// class _GoogleMapHomePageState extends State<GoogleMapHomePage> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // ===== AppBar =====
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(179, 214, 246, 255),
//         title: Center(
//           child: RichText(
//             text: TextSpan(
//               children: [
//                 const TextSpan(
//                   text: 'Live ',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'Tracking',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         centerTitle: true,
//       ),

//       // ===== Body ===== //
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 18),
//         child: Column(
//           children: [
//             // ===== Cars Status Container =====
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 6,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   buildCarItem(Icons.directions_car, "Moving", "(7)", Colors.green),
//                   buildCarItem(Icons.directions_car_sharp, "Parking", "(10)", Colors.blue),
//                   buildCarItem(Icons.directions_car, "Idling", "(4)", Colors.deepOrangeAccent),
//                   buildCarItem(Icons.car_repair, "Towed", "(18)", Colors.red),
//                 ],
//               ),
//             ),

//             // ===== Map Preview =====
//             Center(
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const GoogleMapBody()),
//                   );
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   height: 180,
//                   margin: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(15),
//                     image: const DecorationImage(
//                       image: NetworkImage(
//                         'https://via.placeholder.com/400x180.png?text=Map+Image',
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

//       // ===== Bottom Navigation Bar =====
//       bottomNavigationBar: CustomBottomBar(
//         selectedIndex: selectedIndex,
//         onItemTapped: (index) {
//           setState(() {
//             selectedIndex = index;
//           });

//           // ===== Navigation Logic =====
//           switch (index) {
//             case 0:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const GoogleMapHomePage()),
//               );
//               break;

//             case 1:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const GoogleMapBody()),
//               );
//               break;

//             case 2:
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Notifications Page")),
//               );
//               break;

//             case 3:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const CustomDrawer()),
//               );
//               break;
//           }
//         },
//       ),
//     );
//   }
// }

// Widget buildCarItem(IconData icon, String title, String subtitle, Color coloring) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Icon(icon, size: 30, color: coloring),
//       const SizedBox(height: 6),
//       Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//       Text(
//         subtitle,
//         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//       ),
//     ],
//   );
// }

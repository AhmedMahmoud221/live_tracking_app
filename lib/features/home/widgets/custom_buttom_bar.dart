// // ===== Bottom Bar =====
// import 'package:flutter/material.dart';
// import 'package:live_tracking/features/home/google_map_home_page.dart';

// class CustomBottomBar extends StatefulWidget {
//   final int selectedIndex;
//   final Function(int) onItemTapped;

//   const CustomBottomBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onItemTapped,
//   });

//   @override
//   State<CustomBottomBar> createState() => _CustomBottomBarState();
// }

// class _CustomBottomBarState extends State<CustomBottomBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           buildBarItem(Icons.home, 'Home', 0, context),
//           buildBarItem(Icons.map, 'Map', 1, context),
//           buildBarItem(Icons.notification_add, 'Notification', 2, context),
//           buildBarItem(Icons.more_horiz_outlined, 'More', 3, context),
//         ],
//       ),
//     );
//   }

//   Widget buildBarItem(
//       IconData icon, String label, int index, BuildContext context) {
//         bool isSelected = index == widget.selectedIndex;

//         return GestureDetector(
//       onTap: () {
//         onItemTapped(index);
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: isSelected
//             ? BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(30),
//               )
//             : null,
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: isSelected ? Colors.white : Colors.grey[700],
//             ),
//             if (isSelected)
//               Padding(
//                 padding: const EdgeInsets.only(left: 8),
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
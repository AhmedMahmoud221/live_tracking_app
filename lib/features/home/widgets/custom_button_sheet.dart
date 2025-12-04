import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomButtonSheet extends StatelessWidget {
  // final List<DeviceModel> devices;
  // final Function(DeviceModel) onSelectDevice;
  // final DraggableScrollableController sheetController;

  const CustomButtonSheet({
    super.key,
    // required this.devices,
    // required this.onSelectDevice, required this.sheetController,
  });

  @override
  Widget build(BuildContext context) {
    // final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        showMaterialModalBottomSheet(
          duration: Duration(milliseconds: 500),
          context: context,
          backgroundColor: Colors.transparent, // مهم جدًا
          builder: (context) => Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            height: 600,
            child: Row(
              children: [
                const Icon(Icons.car_crash, size: 32),
                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    'device.name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),

                Icon(Icons.double_arrow),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 202, 202, 202),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(Icons.car_rental, size: 28),
      ),
    );
  }
}















    // DraggableScrollableSheet(
    //   controller: sheetController,   // <-- المهم
    //   initialChildSize: 0.15,
    //   maxChildSize: 0.9,
    //   minChildSize: 0.15,
    //   builder: (context, scrollController) {
    //     return Container(
    //       padding: const EdgeInsets.all(16),
    //       decoration: BoxDecoration(
    //         color: isDark ? const Color(0XFF7B7B7B) : Colors.white,
    //         borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
    //       ),
    //       child: Column(
    //         children: [
    //           Container(
    //             width: 40,
    //             height: 5,
    //             decoration: BoxDecoration(
    //               color: isDark ? Colors.white70 : const Color(0XFF7B7B7B),
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //           ),
    //           const SizedBox(height: 15),

    //           Text(
    //             "Devices",
    //             style: TextStyle(
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //               color: isDark ? Colors.white : const Color(0XFF7B7B7B),
    //             ),
    //           ),

    //           const SizedBox(height: 15),

    //           Expanded(
    //             child: ListView.builder(
    //               controller: scrollController,
    //               itemCount: devices.length,
    //               itemBuilder: (context, index) {
    //                 final device = devices[index];
    //                 final isOnline = device.status == "online";

    //                 return InkWell(
    //                   onTap: () {
    //                     onSelectDevice(device);

    //                     // ↓↓↓ ينزل الشيت لتحت لحد 15%
    //                     sheetController.animateTo(
    //                       0.15,
    //                       duration: const Duration(seconds: 1),
    //                       curve: Curves.easeOut,
    //                     );
    //                    },
    //                   child: Container(
    //                     padding: const EdgeInsets.symmetric(
    //                         vertical: 18, horizontal: 12),
    //                     margin: const EdgeInsets.only(bottom: 15),
    //                     decoration: BoxDecoration(
    //                       color:
    //                           isDark ? const Color(0XFF7B7B7B) : Colors.grey[100],
    //                       borderRadius: BorderRadius.circular(15),
    //                     ),
    //                     child: Row(
    //                       children: [
    //                         const Icon(Icons.location_on_outlined, size: 32),
    //                         const SizedBox(width: 12),

    //                         Expanded(
    //                           child: Text(
    //                             device.name,
    //                             style: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.w600,
    //                               color: isDark
    //                                   ? Colors.white
    //                                   : const Color.fromARGB(255, 82, 82, 82),
    //                             ),
    //                           ),
    //                         ),

    //                         Row(
    //                           children: [
    //                             Container(
    //                               width: 12,
    //                               height: 12,
    //                               decoration: BoxDecoration(
    //                                 color: isOnline ? Colors.green : Colors.red,
    //                                 shape: BoxShape.circle,
    //                               ),
    //                             ),
    //                             const SizedBox(width: 6),
    //                             Text(
    //                               isOnline ? "Online" : "Offline",
    //                               style: TextStyle(
    //                                 fontSize: 14,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: isOnline ? Colors.green : Colors.red,
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );

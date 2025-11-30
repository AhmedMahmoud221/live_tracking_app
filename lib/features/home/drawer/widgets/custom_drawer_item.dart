import 'package:flutter/material.dart';
import 'package:live_tracking/features/auth/models/drawer_item_model.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      child: ListTile(
        leading: Icon(
          drawerItemModel.icon,
          color: drawerItemModel.iconColor 
              ?? (isDark ? Colors.white70 : Color(0XFF7B7B7B)), // Use iconColor if provided, else adapt to theme
          size: 26,
        ),
        title: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            drawerItemModel.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white     // dark mode ( white color )
                  : const Color(0xFF7B7B7B), // light mode ( dark grey color )
            ),
          ),
        ),
      ),
    );
  }
}
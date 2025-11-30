import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking/core/utils/app_router.dart';
import 'package:live_tracking/features/auth/models/drawer_item_model.dart';
import 'package:live_tracking/features/home/drawer/widgets/custom_divider.dart';
import 'package:live_tracking/features/home/drawer/widgets/custom_drawer_items_list.dart';
import 'package:live_tracking/features/home/drawer/widgets/custom_logout_button.dart';
import 'package:live_tracking/features/home/drawer/widgets/custom_toggle.dart';
import 'package:live_tracking/features/home/drawer/widgets/drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  static const List<DrawerItemModel> items = [
    DrawerItemModel(title: 'Profile', icon: Icons.account_circle,),
    DrawerItemModel(title: 'Notification', icon: Icons.notifications),
    DrawerItemModel(title: 'Setting', icon: Icons.settings),
    DrawerItemModel(title: 'About', icon: Icons.info),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 

    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          DrawerHeaderInfo(),

          SizedBox(height: 14),

          // Toggle the theme mode
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomToggle(theme: theme),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CustomDivider(theme: theme),
          ),

          SizedBox(height: 10),

          Expanded(child: CustomDrawerItemsListView(items: items)),

          GestureDetector(
            onTap: () {
              GoRouter.of(context).go(AppRouter.kLoginPageView);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 28),
              child: CustomLogoutButton(theme: theme),
            ),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}





// colore 0XFFE2F2FF  & Color(0XFF7B7B7B)

// roboto & inter
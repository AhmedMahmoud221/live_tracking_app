import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking/core/utils/app_router.dart';
import 'package:live_tracking/core/utils/storage_helper.dart';
import 'package:live_tracking/features/auth/models/drawer_item_model.dart';
import 'package:live_tracking/features/data/services/auth_service.dart';
import 'package:live_tracking/features/home/drawer/widgets/custom_divider.dart';
import 'package:live_tracking/features/home/drawer/widgets/custom_drawer_items_list.dart';
import 'package:live_tracking/features/home/drawer/widgets/custom_logout_button.dart';
import 'package:live_tracking/features/home/drawer/widgets/custom_toggle.dart';
import 'package:live_tracking/features/home/drawer/widgets/drawer_header.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  static const List<DrawerItemModel> items = [
    DrawerItemModel(title: 'Profile', icon: Icons.account_circle,),
    DrawerItemModel(title: 'Notification', icon: Icons.notifications),
    DrawerItemModel(title: 'Setting', icon: Icons.settings),
    DrawerItemModel(title: 'About', icon: Icons.info),
  ];

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isLoading = false;

  Future<void> _onLogoutPressed(BuildContext context) async {
  setState(() => isLoading = true);

  try {
    final token = await SecureStorage.readToken();

    if (token != null) {
      await AuthService().logoutbutton(token);
    }

    await SecureStorage.deleteToken();

    if (!mounted) return;
    GoRouter.of(context).go(AppRouter.kLoginPageView);

  } catch (e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logout failed: $e')),
    );
  }
}
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

          Expanded(child: CustomDrawerItemsListView(items: CustomDrawer.items)),

          GestureDetector(
            onTap: () => _onLogoutPressed(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 28),
              child: isLoading
                  ? CircularProgressIndicator()
                  : CustomLogoutButton(theme: theme),
            ),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}



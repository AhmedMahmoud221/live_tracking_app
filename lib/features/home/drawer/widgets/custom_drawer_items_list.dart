import 'package:flutter/material.dart';
import 'package:live_tracking/features/auth/models/drawer_item_model.dart';
import 'package:live_tracking/features/home/drawer/widgets/custom_drawer_item.dart';

class CustomDrawerItemsListView extends StatelessWidget {
  const CustomDrawerItemsListView({
    super.key,
    required this.items,
  });

  final List<DrawerItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length, 
      itemBuilder: (context, index) {
      return CustomDrawerItem(drawerItemModel: items[index]);
      },
    );
  }
}
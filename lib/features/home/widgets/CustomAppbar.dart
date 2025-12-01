import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbar({
    super.key,
    required this.ScaffoldKey,
  });

  final GlobalKey<ScaffoldState> ScaffoldKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.brightness == Brightness.dark
              ? Color(0XFF7B7B7B)
              : Color(0XFFE2F2FF),
      leading: IconButton(
        color: theme.brightness == Brightness.dark
              ? Colors.white
              : Color(0XFF7B7B7B),
        icon: Icon(Icons.menu, size: 30),
        onPressed: () => ScaffoldKey.currentState!.openDrawer(),
      ),
      title: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Live ',
                style: TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: 'Tracking',
                style: TextStyle(color: theme.brightness == Brightness.dark
              ? Colors.white
              : Color(0XFF7B7B7B), 
              fontSize: 22, 
              fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage("assets/images/profilePhoto.jpg"),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

    // for PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
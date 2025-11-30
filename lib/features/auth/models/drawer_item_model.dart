import 'package:flutter/material.dart';

class DrawerItemModel {
  
  final String title;
  final IconData icon;
  final Color? iconColor;

  const DrawerItemModel({
    required this.title, 
    required this.icon,
    this.iconColor,
    });
}
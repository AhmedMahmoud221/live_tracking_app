import 'package:flutter/material.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({
    super.key,
    required this.theme,
  });
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.logout,
          color: Colors.red,
          size: 36,
        ),
        SizedBox(width: 14),
        Text(
          'Logout',
          style: theme.textTheme.bodySmall?.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white     // dark mode ( white color )
            : const Color(0xFF7B7B7B), // light mode ( dark grey color ),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
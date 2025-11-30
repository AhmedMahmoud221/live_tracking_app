import 'package:flutter/material.dart';
import 'package:live_tracking/core/constants/theme_provider.dart';

class DarkModeButton extends StatefulWidget {
  const DarkModeButton({
    super.key,
    required this.theme,
  });
  final ThemeData theme;

  @override
  State<DarkModeButton> createState() => _DarkModeButtonState();
}

class _DarkModeButtonState extends State<DarkModeButton> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor:  isDark ? Colors.white : Colors.black, // Button color based on theme
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        ThemeProvider.toggleTheme(); // Toggle the theme mode
      },
      icon: Icon(Icons.dark_mode, color: isDark ? Colors.black : Colors.white),
      label: Text(
        "Dark Mode",
        style: TextStyle(color: isDark ? Colors.black : Colors.white, fontSize: 16),
      ),
    );
  }
}

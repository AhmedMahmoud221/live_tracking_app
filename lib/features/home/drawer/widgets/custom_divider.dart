
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white     // dark mode ( white color )
                  : const Color.fromARGB(255, 224, 224, 224), // light mode ( dark grey color ),
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}

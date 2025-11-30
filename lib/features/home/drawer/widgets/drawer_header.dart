import 'package:flutter/material.dart';
import 'package:live_tracking/core/utils/assets.dart';

class DrawerHeaderInfo extends StatelessWidget {
  const DrawerHeaderInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
    return Container(
        width: double.infinity,
        height: 300,
        padding: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          color: theme.brightness == Brightness.dark
              ? Color(0XFF7B7B7B)
              : Color(0XFFE2F2FF),

          // Bottom right radius for rounded corner
          borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40),
        ),
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Container(
              width: 120,   // ضعف الـ radius
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black.withOpacity(0.2), width: 1),
                image: DecorationImage(
                  image: AssetImage(AssetsData.profile),
                  fit: BoxFit.fill, // يحافظ على نسب الصورة ويملأ الدائرة
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Ahmed Mahmoud',
            style:  theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white     // dark mode ( white color )
                  : const Color.fromARGB(255, 53, 53, 53), // light mode ( dark grey color )
            ),
          ),
          Text(
            'ahmed@gmail.com',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white     // dark mode ( white color )
                  : const Color(0xFF7B7B7B), // light mode ( dark grey color ),
            ),
          ),
        ],
      ),
    );
  }
}


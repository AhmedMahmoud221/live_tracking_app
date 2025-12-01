import 'package:flutter/material.dart';
import 'package:live_tracking/core/constants/theme_provider.dart';
import 'package:live_tracking/core/utils/app_router.dart';

void main() {
  runApp(const LiveTrackingApp());
}

class LiveTrackingApp extends StatelessWidget {
  const LiveTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeProvider.themeNotifier,
      builder: (context, currentTheme, child) {
        return MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),  // light theme
        darkTheme: ThemeData.dark(),  // dark theme
        themeMode: currentTheme,     // يعتمد على الزرار
        );
      },
    );
  }
}

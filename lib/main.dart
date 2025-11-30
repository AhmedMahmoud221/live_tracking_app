import 'package:flutter/material.dart';
import 'package:live_tracking/core/constants/theme_provider.dart';
import 'package:live_tracking/core/utils/app_router.dart';
import 'package:live_tracking/features/home/widgets/google_map_body.dart';

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
        // theme: ThemeData.light().copyWith(textTheme: ThemeData.dark().textTheme),
        theme: ThemeData.light(),   // ثيم النهار
        darkTheme: ThemeData.dark(), // ثيم الليل
        themeMode: currentTheme,     // يعتمد على الزرار
        );
      },
    );
  }
}

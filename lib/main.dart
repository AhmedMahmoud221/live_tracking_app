import 'package:flutter/material.dart';
import 'package:live_tracking/core/constants/theme_provider.dart';
import 'package:live_tracking/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeProvider.themeNotifier,
      builder: (context, currentTheme, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Live Tracking App',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: currentTheme,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}

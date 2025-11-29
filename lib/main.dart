import 'package:flutter/material.dart';
import 'package:live_tracking_app/core/utils/app_router.dart';

void main() {
  runApp(const LiveTrackingApp());
}

class LiveTrackingApp extends StatelessWidget {
  const LiveTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(textTheme: ThemeData.dark().textTheme),
    );
  }
}

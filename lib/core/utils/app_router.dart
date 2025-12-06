import 'package:go_router/go_router.dart';
import 'package:live_tracking/features/google%20Map/presentation/pages/google_map_page.dart';
import 'package:live_tracking/main_navigation.dart';
import '../../features/splash/views/splash_view.dart';

class AppRouter {
  static const kSplashView = '/';
  static const kMainPage = '/main';
  static const kGoogleMapBody = '/google';

  static final router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: kMainPage, builder: (context, state) => const MainPage()),
      GoRoute(path: kGoogleMapBody, builder: (c, s) => const GoogleMapPage()),
    ],
  );
}

import 'package:go_router/go_router.dart';
import 'package:live_tracking/main_navigation.dart';
import '../../features/splash/views/splash_view.dart';

class AppRouter {
  static const kSplashView = '/';
  static const kMainPage = '/main';

  static final router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: kMainPage, builder: (context, state) => const MainPage()),
    ],
  );
}

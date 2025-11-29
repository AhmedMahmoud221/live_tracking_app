import 'package:go_router/go_router.dart';
import 'package:live_tracking_app/features/auth/login/login_page_view.dart';
import 'package:live_tracking_app/features/auth/signup/signup_page_view.dart';
import 'package:live_tracking_app/features/home/google_map_view.dart';
import 'package:live_tracking_app/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kLoginPageView = '/loginPageView';
  static const kGoogleMapView = '/googleMapView';
  static const kSignupPageView = '/signupPageView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/', // this is location
        builder: (context, state) =>
            const SplashView(), // this route to the page
      ),

      GoRoute(
        path: kLoginPageView,
        builder: (context, state) => const LoginPageView(),
      ),

      GoRoute(
        path: kGoogleMapView,
        builder: (context, state) => const GoogleMapView(),
      ),

      GoRoute(
        path: kSignupPageView,
        builder: (context, state) => const SignupPageView(),
      ),
    ],
  );
}

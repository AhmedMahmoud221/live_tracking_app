import 'package:go_router/go_router.dart';
import 'package:live_tracking/features/auth/login/login_page_view.dart';
import 'package:live_tracking/features/auth/login/signup/signup_page_view.dart';
import 'package:live_tracking/features/home/google_map_home_page.dart';
import 'package:live_tracking/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kLoginPageView = '/loginPageView';
  static const kGoogleMapHomePage = '/googleMapView';
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
        path: kGoogleMapHomePage,
        builder: (context, state) => const GoogleMapHomePage(),
      ),

      GoRoute(
        path: kSignupPageView,
        builder: (context, state) => const SignupPageView(),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking_app/core/utils/app_router.dart';
import 'package:live_tracking_app/core/utils/assets.dart';
import 'package:live_tracking_app/features/splash/views/widgets/animation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToHome(); // This is Navigate to the  HomePage by transtionDuration
  }

  @override
  void dispose() {
    super.dispose();

    animationController
        .dispose(); //Unsubscribe from streams and close network connections to avoid memory leaks and ensure the application functions efficiently.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(AssetsData.splash),
        ),
        DotsJumpAnimation(),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Timer Animathion
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5), // Position Animation Start & End
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      GoRouter.of(context).push(AppRouter.kLoginPageView);
    });
  }
}

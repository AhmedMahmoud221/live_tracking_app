import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking_app/core/utils/app_router.dart';
import 'package:live_tracking_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(AppRouter.kGoogleMapView);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 36, 167, 255),
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            'Log In',
            style:Styles.textStyle20.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            )
            ),),
      ),
    );
  }
}
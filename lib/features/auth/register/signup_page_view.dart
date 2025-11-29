import 'package:flutter/material.dart';
import 'package:live_tracking_app/features/auth/register/widgets/signup_page_body.dart';

class SignupPageView extends StatelessWidget {
  static const id = '/signup';
  const SignupPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SignupPageBody();
  }
}

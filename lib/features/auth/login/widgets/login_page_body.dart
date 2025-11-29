import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking_app/core/utils/app_router.dart';
import 'package:live_tracking_app/core/utils/assets.dart';
import 'package:live_tracking_app/core/utils/styles.dart';
import 'package:live_tracking_app/features/auth/login/widgets/custom_account_option.dart';
import 'package:live_tracking_app/features/auth/login/widgets/custom_button.dart';
import 'package:live_tracking_app/features/auth/login/widgets/custom_text_field.dart';
import 'package:live_tracking_app/features/auth/login/widgets/live_tracking_text.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPageBody extends StatefulWidget {
  static const id = '/login';
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

String? email, password;

class _LoginPageBodyState extends State<LoginPageBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      // live tracking text
                      SizedBox(child: LiveTrackingText()),

                      // image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          AssetsData.login,
                          height: 250,
                          width: 350,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // sign in text
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sign In',
                            style: Styles.textStyle18.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      // custom text fields
                      SizedBox(
                        width: 350,
                        child: CustomTextField(
                          hint: 'Email',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // custom text fields
                      SizedBox(
                        width: 350,
                        child: CustomTextField(
                          hint: 'Password',
                          controller: TextEditingController(),
                          isPassword: true,
                        ),
                      ),

                      // account option
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: CustomAccountOption(
                          onPressed: () {
                            GoRouter.of(context).go(AppRouter.kSignupPageView);
                          },
                          text1: 'You don\'t have an account?',
                          text2: 'Sign Up',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // custom button
              SizedBox(
                width: 350,
                child: CustomButton(
                  buttonText: 'Log In',
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kGoogleMapView);
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });

      // login Fake Firebase
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isLoading = false;
        });

        if (email == "test@test.com" && password == "123456") {
          GoRouter.of(context).go(AppRouter.kGoogleMapView);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid email or password')),
          );
        }
      });
    }
  }
}

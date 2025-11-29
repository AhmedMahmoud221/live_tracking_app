import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking/core/utils/app_router.dart';
import 'package:live_tracking/core/utils/assets.dart';
import 'package:live_tracking/core/utils/styles.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_account_option.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_button.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_text_field.dart';
import 'package:live_tracking/features/auth/login/widgets/live_tracking_text.dart';
import 'package:live_tracking/features/auth/login/widgets/login_page_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPageBody extends StatefulWidget {
  const SignupPageBody({super.key});

  @override
  State<SignupPageBody> createState() => _SignupPageBodyState();
}

class _SignupPageBodyState extends State<SignupPageBody> {
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
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
                      LiveTrackingText(),

                      const SizedBox(height: 20),

                      // image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          AssetsData.signup,
                          height: 200,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // sign up text
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sign Up',
                            style: Styles.textStyle18.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      // custrom text fields
                      SizedBox(
                        width: 350,
                        child: CustomTextField(
                          hint: 'Enter your email',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // custrom text fields
                      SizedBox(
                        width: 350,
                        child: CustomTextField(
                          hint: 'Enter your password',
                          controller: TextEditingController(),
                          isPassword: true,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // custrom text fields
                      SizedBox(
                        width: 350,
                        child: CustomTextField(
                          hint: 'Confirm Password',
                          controller: TextEditingController(),
                          isPassword: true,
                        ),
                      ),

                      // account option
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: CustomAccountOption(
                          onPressed: () {
                            GoRouter.of(context).go(AppRouter.kLoginPageView);
                          },
                          text1: 'Already have an account?',
                          text2: 'Sign In',
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
                  buttonText: 'Register',
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kLoginPageView);
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

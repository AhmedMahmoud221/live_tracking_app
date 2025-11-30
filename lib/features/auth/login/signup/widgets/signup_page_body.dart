import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking/core/utils/app_router.dart';
import 'package:live_tracking/core/utils/assets.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_account_option.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_button.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_text_feild_head.dart';
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                        
                        // image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            AssetsData.signup,
                            height: 300,
                            width: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
            
                        //sign up text
                        CustomTextFeildHead(
                          title: 'Username',
                        ),
                        
                        // custrom text fields
                        SizedBox(
                          child: CustomTextField(
                            hint: 'Enter your username',
                            controller: TextEditingController(),
                            keyboardType: TextInputType.emailAddress,
                            isPassword: false,
                          ),
                        ),
                        
                        CustomTextFeildHead(
                          title: 'Email',
                        ),
            
                        // custrom text fields
                        SizedBox(
                          child: CustomTextField(
                            hint: 'Enter your email',
                            controller: TextEditingController(),
                            keyboardType: TextInputType.emailAddress,
                            isPassword: false,
                          ),
                        ),
            
                        CustomTextFeildHead(
                          title: 'Password',
                        ),
            
                        // custrom text fields
                        SizedBox(
                          child: CustomTextField(
                            hint: 'Enter your password',
                            controller: TextEditingController(),
                            isPassword: true,
                          ),
                        ),
            
                        CustomTextFeildHead(
                          title: 'Confirm Password',
                        ),
            
                        // custrom text fields
                        SizedBox(
                          child: CustomTextField(
                            hint: 'Confirm Password',
                            controller: TextEditingController(),
                            isPassword: true,
                          ),
                        ),
            
                        // account option
                        CustomAccountOption(
                          onPressed: () {
                            GoRouter.of(context).go(AppRouter.kLoginPageView);
                          },
                          text1: 'Already have an account ?',
                          text2: 'Sign In',
                        ),
                      ],
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                // custom button
                SizedBox(
                  child: CustomButton(
                    buttonText: 'Sign Up',
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
          GoRouter.of(context).go(AppRouter.kGoogleMapHomePage);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid email or password')),
          );
        }
      });
    }
  }
}



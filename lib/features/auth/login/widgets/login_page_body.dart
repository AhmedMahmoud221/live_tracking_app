import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking/core/utils/app_router.dart';
import 'package:live_tracking/core/utils/assets.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_account_option.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_button.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_text_feild_head.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_text_field.dart';
import 'package:live_tracking/features/auth/login/widgets/live_tracking_text.dart';
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                              fit: BoxFit.cover,
                            ),
                          ),
                                  
                          const SizedBox(height: 10),
                                  
                          // sign in text
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Text(
                          //     'Sign In',
                          //     style: Styles.textStyle18.copyWith(
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),

                          CustomTextFeildHead(title: 
                            'Email',
                          ),
                                  
                          const SizedBox(height: 6),
                                  
                          // custom text fields
                          SizedBox(
                            child: CustomTextField(
                              hint: 'Enter your email',
                              controller: TextEditingController(),
                              keyboardType: TextInputType.emailAddress,
                              isPassword: false,
                            ),
                          ),

                          const SizedBox(height: 6),
                                  
                          CustomTextFeildHead(title: 
                            'Password',
                          ),
                                  
                          // custom text fields
                          SizedBox(
                            child: CustomTextField(
                              hint: 'Enter your password',
                              controller: TextEditingController(),
                              isPassword: true,
                            ),
                          ),
                                  
                          // account option
                          CustomAccountOption(
                            onPressed: () {
                              GoRouter.of(context).go(AppRouter.kSignupPageView);
                            },
                            text1: 'You don\'t have an account ?',
                            text2: 'Sign Up',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                // custom button
                SizedBox(
                  child: CustomButton(
                    buttonText: 'Sign In',
                    onTap: () {
                      GoRouter.of(context).go(AppRouter.kGoogleMapHomePage);
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

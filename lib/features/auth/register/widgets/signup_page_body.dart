import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking_app/core/utils/app_router.dart';
import 'package:live_tracking_app/core/utils/assets.dart';
import 'package:live_tracking_app/core/utils/styles.dart';
import 'package:live_tracking_app/features/auth/login/widgets/custom_button.dart';
import 'package:live_tracking_app/features/auth/login/widgets/custom_text_field.dart';
import 'package:live_tracking_app/features/auth/login/widgets/login_page_body.dart';
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Live',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Tracking',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // الصورة
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          AssetsData.login,
                          height: 250,
                          width: 300, // نفس العرض لكل العناصر
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 10),
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

                      // TextFormFields
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

                      SizedBox(
                        width: 350,
                        child: CustomTextField(
                          hint: 'Enter your password',
                          controller: TextEditingController(),
                          isPassword: true,
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        width: 350,
                        child: CustomTextField(
                          hint: 'Confirm Password',
                          controller: TextEditingController(),
                          isPassword: true,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Already have an account?',
                              style: Styles.textStyle16.copyWith(
                                color: Colors.black54.withOpacity(0.3),
                              ),
                            ),
                            SizedBox(width: 2),
                            TextButton(
                              onPressed: () {
                                GoRouter.of(
                                  context,
                                ).go(AppRouter.kLoginPageView);
                              },
                              child: Text(
                                'Sign In',
                                style: Styles.textStyle16.copyWith(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

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

      // login وهمي بدون Firebase
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

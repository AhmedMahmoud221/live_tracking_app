import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking/core/utils/app_router.dart';
import 'package:live_tracking/core/utils/assets.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_account_option.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_button.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_text_feild_head.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_text_field.dart';
import 'package:live_tracking/features/auth/login/widgets/live_tracking_text.dart';
import 'package:live_tracking/features/data/services/auth_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPageBody extends StatefulWidget {
  const SignupPageBody({super.key});

  @override
  State<SignupPageBody> createState() => _SignupPageBodyState();
}

class _SignupPageBodyState extends State<SignupPageBody> {
  bool isLoading = false;

  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmCtrl = TextEditingController();

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
                        const SizedBox(height: 20),

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

                        // Username
                        const CustomTextFeildHead(title: 'Username'),
                        CustomTextField(
                          hint: 'Enter your username',
                          controller: _nameCtrl,
                          isPassword: false,
                        ),

                        // Email
                        const CustomTextFeildHead(title: 'Email'),
                        CustomTextField(
                          hint: 'Enter your email',
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                        ),

                        // Password
                        const CustomTextFeildHead(title: 'Password'),
                        CustomTextField(
                          hint: 'Enter your password',
                          controller: _passwordCtrl,
                          isPassword: true,
                        ),

                        // Confirm Password
                        const CustomTextFeildHead(title: 'Confirm Password'),
                        CustomTextField(
                          hint: 'Confirm Password',
                          controller: _confirmCtrl,
                          isPassword: true,
                        ),

                        // Account option
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

                // Sign Up button
                CustomButton(
                  buttonText: 'Sign Up',
                  onTap: _onSignupPressed,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    if (_nameCtrl.text.isEmpty ||
        _emailCtrl.text.isEmpty ||
        _passwordCtrl.text.isEmpty ||
        _confirmCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return false;
    }

    if (_passwordCtrl.text != _confirmCtrl.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return false;
    }

    return true;
  }

  void _onSignupPressed() async {
    if (!_validateForm()) return;

    setState(() {
      isLoading = true;
    });

    try {
      final result = await AuthService().signup(
        name: _nameCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text.trim(),
        passwordConfirm: _confirmCtrl.text.trim(),
      );

      setState(() {
        isLoading = false;
      });

      // بعد نجاح التسجيل، اطبع التوكن أو خزنه
      // print('Token: ${result.token}');

      // Navigate to home page
      GoRouter.of(context).go(AppRouter.kLoginPageView);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${e.toString()}')),
      );
    }
  }
}

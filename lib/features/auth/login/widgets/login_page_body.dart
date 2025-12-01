import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking/core/utils/app_router.dart';
import 'package:live_tracking/core/utils/assets.dart';
import 'package:live_tracking/core/utils/storage_helper.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_account_option.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_button.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_text_feild_head.dart';
import 'package:live_tracking/features/auth/login/widgets/custom_text_field.dart';
import 'package:live_tracking/features/auth/login/widgets/live_tracking_text.dart';
import 'package:live_tracking/features/data/services/auth_service.dart';
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
  
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
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

                          CustomTextFeildHead(title: 
                            'Email',
                          ),
                                  
                          const SizedBox(height: 6),
                                  
                          // custom text fields
                          SizedBox(
                            child: CustomTextField(
                              hint: 'Enter your email',
                              controller: _emailCtrl,
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
                                controller: _passwordCtrl,
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
                    onTap: _onLoginPressed,
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

  void _onLoginPressed() async {
  if (_emailCtrl.text.isEmpty || _passwordCtrl.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill all fields')),
    );
    return;
  }

  setState(() => isLoading = true);

  try {
    final result = await AuthService().login(
      email: _emailCtrl.text.trim(),
      password: _passwordCtrl.text.trim(),
    );

    // حفظ التوكين
    await SecureStorage.saveToken(result.token);

      GoRouter.of(context).go(AppRouter.kGoogleMapHomePage);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }
}
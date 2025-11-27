import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_tracking_app/core/utils/app_router.dart';
import 'package:live_tracking_app/core/utils/assets.dart';
import 'package:live_tracking_app/features/auth/login/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPageBody extends StatefulWidget {
  static const id = '/login';
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool isLoading = false;

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

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                // الصورة
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    AssetsData.test2,
                    height: 250,
                    width: 350, // نفس العرض لكل العناصر
                    fit: BoxFit.cover,
                  ),
                ),
                    
                const SizedBox(height: 30),
                    
                // TextFormFields
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (v) => email = v,
                    validator: (v) => (v == null || v.isEmpty) ? 'Enter email' : null,
                  ),
                ),
                    
                const SizedBox(height: 10),
                    
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'),
                    onChanged: (v) => password = v,
                    validator: (v) => (v == null || v.isEmpty) ? 'Enter password' : null,
                  ),
                ),
                    
                const SizedBox(height: 30),
                    
                SizedBox(
                  width: 350,
                  child: CustomButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

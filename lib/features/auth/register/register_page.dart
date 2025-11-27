// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:live_tracking_app/core/utils/app_router.dart';
// import 'package:live_tracking_app/core/utils/assets.dart';
// import 'package:live_tracking_app/features/auth/login/widgets/custom_button.dart';
// import 'package:live_tracking_app/features/auth/login/widgets/custom_text_field.dart';
// import 'package:live_tracking_app/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
// import 'package:live_tracking_app/features/auth/presentation/cubit/auth_cubit/auth_state.dart';
// import 'package:live_tracking_app/helper/show_snack_bar.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class RegisterPage extends StatelessWidget {
//   String? email;
//   String? password;
//   bool isLoading = false;

//   GlobalKey<FormState> formKey = GlobalKey();
//   static String id = 'RegisterPage';

//   RegisterPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthCubit, AuthState>(
//       listener: (context, state) {
//         if (state is AuthLoading) {
//           isLoading = true ;
//         } else if (state is AuthSuccess) {
//           Navigator.pushNamed(context, AppRouter.kGoogleMapView, arguments: email);
        
//            isLoading = false;
//         } else if (state is AuthFailure) {
//           showSnackBar(context, state.errmessage);
//           isLoading = false;
//         }
//       },
//       builder: (context, state) {
//         return ModalProgressHUD(
//           inAsyncCall: isLoading,
//           child: Scaffold(
//             backgroundColor: Colors.blueGrey,
//             body: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Form(
//                 key: formKey,
//                 child: ListView(
//                   children: [
//                     SizedBox(height: 75),
//                     Image.asset( AssetsData.loginImage, height: 100),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Scholar Chat',
//                           style: TextStyle(
//                             fontSize: 32,
//                             color: Colors.white,
//                             fontFamily: 'pacifico',
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 95),
//                     Row(
//                       children: [
//                         Text(
//                           'Register',
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                       ],
//                     ),

//                     SizedBox(height: 15),

//                     CustomFormTextField(
//                       onChanged: (data) {
//                         email = data;
//                       },
//                       hintText: 'Email',
//                     ),

//                     SizedBox(height: 10),

//                     CustomFormTextField(
//                       obscureText: true,
//                       onChanged: (data) {
//                         password = data;
//                       },
//                       hintText: 'Password',
//                     ),

//                     SizedBox(height: 30),

//                     CustomButton(
//                       onTap: () async {
//                         if (formKey.currentState!.validate()) {
//                           BlocProvider.of<AuthCubit>(
//                             context,
//                           ).registerUser(email: email!, password: password!);
//                         }
//                       },

//                       text: 'Sign Up',
//                     ),

//                     SizedBox(height: 10),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'already have an account  ?',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             '   Sign In',
//                             style: TextStyle(color: Color(0xffC7EDE6)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

// }
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:live_tracking_app/features/auth/domain/repositories/auth_repository.dart';
// import 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   final AuthRepository _authRepository;

//   AuthCubit(this._authRepository) : super(AuthInitial());

//   Future<void> login({required String email, required String password}) async {
//     emit(AuthLoading());
//     try {
//       await _authRepository.login(email: email, password: password);
//       emit(AuthSuccess(email: email));
//     } catch (e) {
//       emit(AuthFailure(e.toString()));
//     }
//   }

//   Future<void> logout() async {
//     await _authRepository.logout();
//     emit(AuthInitial());
//   }


//   void registerUser({required String email, required String password}) async {
//   emit(AuthLoading());
//   try {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     emit(AuthSuccess(email: email));
//   } catch (e) {
//     emit(AuthFailure(e.toString()));
//   }
// }
// }





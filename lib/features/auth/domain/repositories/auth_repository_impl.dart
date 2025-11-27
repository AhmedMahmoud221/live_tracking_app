// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:live_tracking_app/features/auth/domain/repositories/auth_repository.dart';

// class FirebaseAuthRepository implements AuthRepository {
//   final FirebaseAuth _firebaseAuth;

//   FirebaseAuthRepository({FirebaseAuth? firebaseAuth})
//       : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

//   @override
//   Future<void> login({required String email, required String password}) async {
//     await _firebaseAuth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   @override
//   Future<void> logout() async {
//     await _firebaseAuth.signOut();
//   }

//   @override
//   Stream<String?> get authStateChanges =>
//       _firebaseAuth.authStateChanges().map((user) => user?.email);
// }

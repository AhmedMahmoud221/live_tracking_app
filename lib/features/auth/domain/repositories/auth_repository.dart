abstract class AuthRepository {
  Future<void> login({required String email, required String password});
  Future<void> logout();
  Stream<String?> get authStateChanges; // optional: stream of user id/email
}

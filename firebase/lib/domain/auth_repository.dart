import 'entitis.dart';

abstract class AuthRepository {
  Future<User?> registerWithEmailAndPassword(String email, String password);
}

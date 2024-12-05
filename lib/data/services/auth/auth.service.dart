import 'package:empregonaarea/data/models/login_params.model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthService {
  Future<AuthResponse> signUpNewUser(String email, String password);

  Future<AuthResponse> signInWithEmail(String email, String password);

  Future<String> saveTokenLocally(LoginParams data);
}

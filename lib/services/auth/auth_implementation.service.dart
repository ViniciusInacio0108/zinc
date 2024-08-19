import 'package:empregonaarea/main.dart';
import 'package:empregonaarea/services/auth/auth.service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthImp implements AuthService {
  @override
  Future<AuthResponse> signUpNewUser(String email, String password) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    return res;
  }

  @override
  Future<AuthResponse> signInWithEmail(String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return res;
  }
}

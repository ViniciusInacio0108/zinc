import 'package:empregonaarea/data/models/login_params.model.dart';
import 'package:empregonaarea/main.dart';
import 'package:empregonaarea/data/services/auth/auth.service.dart';
import 'package:empregonaarea/data/services/local_storage/local_storage.service.dart';
import 'package:empregonaarea/utils/local_storage_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthImp implements AuthService {
  final LocalStorageService localService;
  AuthImp(this.localService);

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

  @override
  Future<String> saveTokenLocally(LoginParams data) {
    return localService.updateDataAsJson(
      LocalStorageKeys().USER_LOGIN_KEY,
      data.toJson(),
    );
  }

  @override
  Future<bool> logOutUser() async {
    try {
      await supabase.auth.signOut(scope: SignOutScope.local);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteLocalUserInfo() async {
    try {
      await localService.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }
}

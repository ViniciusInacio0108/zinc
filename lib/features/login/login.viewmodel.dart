import 'package:empregonaarea/data/models/login_params.model.dart';
import 'package:empregonaarea/features/profile/profile.viewmodel.dart';
import 'package:empregonaarea/data/services/auth/auth.service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'login.viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

enum LoginStateResponse {
  success,
  invalidCredentials,
  unkownError,
}

abstract class _LoginViewModelBase with Store {
  final AuthService authService;

  _LoginViewModelBase({
    required this.authService,
  });

  @observable
  bool isLoggedIn = false;

  @action
  void setIsLoggedState({required bool value}) => isLoggedIn = value;

  @action
  Future<LoginStateResponse> login(LoginParams params) async {
    try {
      final profileVM = GetIt.I.get<ProfileViewModel>();
      setIsLoggedState(value: true);
      final res = await authService.signInWithEmail(params.email, params.password);

      if (res.user == null) {
        return LoginStateResponse.unkownError;
      }

      await authService.saveTokenLocally(params);
      profileVM.setUserIdFromAuth(res.user!.id);
      await profileVM.fetchUserData();

      return LoginStateResponse.success;
    } on AuthException catch (err) {
      if (err.message == "Invalid login credentials") {
        return LoginStateResponse.invalidCredentials;
      }

      return LoginStateResponse.unkownError;
    } finally {
      setIsLoggedState(value: false);
    }
  }

  String? validateEmailLogin(String? value) {
    if (value != null && value.contains("@") && value.isNotEmpty) return null;
    return "Digite um email válido";
  }

  String? validateEmailPassword(String? value) {
    if (value != null && value.length >= 8) return null;
    return "Digite uma senha";
  }
}

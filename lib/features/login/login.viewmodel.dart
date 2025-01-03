import 'package:empregonaarea/data/models/login_params.model.dart';
import 'package:empregonaarea/data/models/profile.model.dart';
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
  emailNotConfirmed,
}

abstract class _LoginViewModelBase with Store {
  final AuthService authService;

  _LoginViewModelBase({
    required this.authService,
  });

  @observable
  bool isLoggedIn = false;

  @observable
  bool isLoadingLogginOut = false;

  @observable
  bool isFirstUserLogin = false;

  @action
  void setIsLoggedState({required bool value}) => isLoggedIn = value;

  @action
  void setIsFirstSignInTrue() {
    isFirstUserLogin = true;
  }

  @action
  void setIsFirstSignInFalse() {
    isFirstUserLogin = false;
  }

  @action
  void verifyUserFirstLogin(ProfileModel profile) {
    if (profile.id == null) {
      setIsFirstSignInTrue();
    } else {
      setIsFirstSignInFalse();
    }
  }

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
      profileVM.setUserEmailFromLogin(res.user?.email ?? "");
      verifyUserFirstLogin(profileVM.profile);

      return LoginStateResponse.success;
    } on AuthException catch (err) {
      if (err.message == "Invalid login credentials") {
        return LoginStateResponse.invalidCredentials;
      } else if (err.message == "Email not confirmed") {
        return LoginStateResponse.emailNotConfirmed;
      }

      return LoginStateResponse.unkownError;
    } finally {
      setIsLoggedState(value: false);
    }
  }

  @action
  Future<bool> logOut() async {
    isLoadingLogginOut = true;
    final isLoggedOut = await authService.logOutUser();
    isLoadingLogginOut = false;
    if (!isLoggedOut) {
      return false;
    }
    isLoggedIn = false;
    await authService.deleteLocalUserInfo();
    return true;
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

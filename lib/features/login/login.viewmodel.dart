import 'package:empregonaarea/data/models/login_params.model.dart';
import 'package:empregonaarea/services/auth/auth.service.dart';
import 'package:mobx/mobx.dart';
part 'login.viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

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
  Future<void> login(LoginParams params) async {
    final res = await authService.signInWithEmail(params.email, params.password);

    if (res.user == null) {
      return;
    }

    setIsLoggedState(value: true);
  }

  @action
  Future<void> logout() async {
    // do the sigout method
    setIsLoggedState(value: false);
  }
}

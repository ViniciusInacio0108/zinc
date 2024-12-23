import 'package:empregonaarea/data/services/auth/auth.service.dart';
import 'package:mobx/mobx.dart';
part 'first_acces.viewmodel.g.dart';

class FirstAccessViewModel = _FirstAccessViewModelBase with _$FirstAccessViewModel;

abstract class _FirstAccessViewModelBase with Store {
  final AuthService authService;

  _FirstAccessViewModelBase(this.authService);

  @observable
  bool isLoadingSignUp = false;

  @action
  String? validateEmail(String? email) {
    if ((email?.length ?? 0) < 10) {
      return "Email deve ter no mínimo 10 caracteres";
    }

    if (email?.contains("@") != true) {
      return "Não é válido";
    }

    return null;
  }

  @action
  String? validatePassword(String? password) {
    if ((password?.length ?? 0) < 8) {
      return "Senha deve ter no mínimo 8 caracteres";
    }

    return null;
  }

  @action
  String? validateConfirmPassword(String? confirmPassword, String password) {
    if ((confirmPassword?.length ?? 0) < 8) {
      return "Senha deve ter no mínimo 8 caracteres";
    }

    if (confirmPassword != password) {
      return "Senhas não são iguais";
    }

    return null;
  }

  @action
  Future<bool> signUp(String email, String password) async {
    try {
      isLoadingSignUp = true;

      await authService.signUpNewUser(email, password);

      return true;
    } catch (e) {
      return false;
    } finally {
      isLoadingSignUp = false;
    }
  }
}

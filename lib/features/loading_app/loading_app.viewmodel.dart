import 'package:empregonaarea/data/models/login_params.model.dart';
import 'package:empregonaarea/features/login/login.viewmodel.dart';
import 'package:empregonaarea/features/profile/profile.viewmodel.dart';
import 'package:empregonaarea/data/services/auth/auth.service.dart';
import 'package:empregonaarea/data/services/local_storage/local_storage.service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'loading_app.viewmodel.g.dart';

class LoadingAppViewModel = _LoadingAppViewModelBase with _$LoadingAppViewModel;

abstract class _LoadingAppViewModelBase with Store {
  final AuthService authService;
  final LocalStorageService localService;

  _LoadingAppViewModelBase({
    required this.authService,
    required this.localService,
  });

  @observable
  bool isLoading = false;

  @action
  Future<bool> autoLogin(String localUserKey) async {
    final profileVM = GetIt.I.get<ProfileViewModel>();
    final loginVM = GetIt.I.get<LoginViewModel>();

    final res = await retrieveLoginDataFromLocalStorage(localUserKey);

    if (res == null) return false;

    final authRes = await authService.signInWithEmail(res.email, res.password);

    if (authRes.user == null) return false;

    profileVM.setUserIdFromAuth(authRes.user!.id);
    await profileVM.fetchUserData();
    loginVM.verifyUserFirstLogin(profileVM.profile);

    return true;
  }

  @action
  Future<LoginParams?> retrieveLoginDataFromLocalStorage(String userKey) async {
    final res = await localService.getDataAsJson(userKey);

    if (res.isEmpty) return null;

    return LoginParams.fromJson(res);
  }
}

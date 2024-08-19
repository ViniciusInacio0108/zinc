import 'package:empregonaarea/features/home/home.viewmodel.dart';
import 'package:empregonaarea/features/loading_app/loading_app.viewmodel.dart';
import 'package:empregonaarea/features/login/login.viewmodel.dart';
import 'package:empregonaarea/services/auth/auth_implementation.service.dart';
import 'package:empregonaarea/services/local_storage/local_storage_implementation.service.dart';
import 'package:get_it/get_it.dart';

void setupDependencieInjection() {
  final instance = GetIt.I;

  instance.registerLazySingleton(
    () => LoadingAppViewModel(
      authService: AuthImp(),
      localService: LocalStorageServiceImp(),
    ),
  );
  instance.registerLazySingleton(
    () => HomeViewModel(),
  );
  instance.registerLazySingleton(
    () => LoginViewModel(
      authService: AuthImp(),
    ),
  );
}

import 'package:empregonaarea/features/loading_app/loading_app.viewmodel.dart';
import 'package:get_it/get_it.dart';

abstract class DependecyInjection<T extends Object> {
  void registerLazySingleton(T Function() function);

  T get();
}

class ImplDependecyInjection<T extends Object> implements DependecyInjection {
  final _getIt = GetIt.instance;

  @override
  void registerLazySingleton(Object Function() function) {
    _getIt.registerLazySingleton(function);
  }

  @override
  T get() {
    return _getIt.get<T>();
  }
}

void setupDependencieInjection() {
  final _instance = ImplDependecyInjection();
  _instance.registerLazySingleton(() => LoadingAppViewModel());
}

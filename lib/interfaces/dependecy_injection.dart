import 'package:empregonaarea/features/detailed_job/detailed_job.viewmodel.dart';
import 'package:empregonaarea/features/home/home.viewmodel.dart';
import 'package:empregonaarea/features/loading_app/loading_app.viewmodel.dart';
import 'package:empregonaarea/features/login/login.viewmodel.dart';
import 'package:empregonaarea/features/profile/profile.viewmodel.dart';
import 'package:empregonaarea/repositories/company/company.repository_impl.dart';
import 'package:empregonaarea/repositories/jobs/jobs.repository_impl.dart';
import 'package:empregonaarea/repositories/profile/profile_impl.repository.dart';
import 'package:empregonaarea/services/auth/auth_implementation.service.dart';
import 'package:empregonaarea/services/local_storage/local_storage_implementation.service.dart';
import 'package:get_it/get_it.dart';

void setupDependencieInjection() {
  final instance = GetIt.I;

  instance.registerLazySingleton(
    () => LoadingAppViewModel(
      authService: AuthImp(
        LocalStorageServiceImp(),
      ),
      localService: LocalStorageServiceImp(),
    ),
  );
  instance.registerLazySingleton(
    () => HomeViewModel(
      jobsRepo: JobsRepositoryImpl(),
    ),
  );
  instance.registerLazySingleton(
    () => LoginViewModel(
      authService: AuthImp(
        LocalStorageServiceImp(),
      ),
    ),
  );
  instance.registerLazySingleton(
    () => DetailedJobsViewModel(
      companyRepo: CompanyRepositoryImpl(),
    ),
  );

  instance.registerLazySingleton<ProfileViewModel>(
    () => ProfileViewModel(profileRepo: ProfileRepositoryImpl()),
  );
}

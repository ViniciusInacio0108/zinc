import 'package:empregonaarea/data/repositories/jobs/jobs.repository.dart';
import 'package:mobx/mobx.dart';
part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final JobsRepository jobsRepo;

  _HomeViewModelBase({required this.jobsRepo});

  @observable
  int currentPageIndex = 0;

  @action
  void setCurrentPageIndex(int i) => currentPageIndex = i;

  @observable
  ObservableList jobs = ObservableList.of([]);

  @observable
  bool isFetchingJobs = false;

  @action
  Future<void> fetchJobs() async {
    isFetchingJobs = true;

    jobs.clear();

    final responseJobs = await jobsRepo.getAllAvailableJobs();

    jobs.addAll(responseJobs);
    isFetchingJobs = false;
  }
}

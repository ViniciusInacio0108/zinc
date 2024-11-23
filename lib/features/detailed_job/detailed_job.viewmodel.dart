import 'package:empregonaarea/data/models/company.model.dart';
import 'package:empregonaarea/repositories/company/company.repository.dart';
import 'package:mobx/mobx.dart';
part 'detailed_job.viewmodel.g.dart';

class DetailedJobsViewModel = _DetailedJobsViewModelBase with _$DetailedJobsViewModel;

abstract class _DetailedJobsViewModelBase with Store {
  final CompanyRepository companyRepo;

  _DetailedJobsViewModelBase({required this.companyRepo});

  @observable
  bool isFetchingData = false;

  @action
  void setIsFetching(bool value) => isFetchingData = value;

  @observable
  CompanyModel currentCompany = CompanyModel.empty();

  @action
  Future<void> fetchCompanyById(String companyId) async {
    isFetchingData = true;

    currentCompany = await companyRepo.getCompanyById(companyId);

    isFetchingData = false;
  }
}

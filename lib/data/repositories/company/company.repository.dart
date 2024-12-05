import 'package:empregonaarea/data/models/company.model.dart';

abstract class CompanyRepository {
  Future<CompanyModel> getCompanyById(String companyId);
}

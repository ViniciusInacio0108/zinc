import 'package:empregonaarea/data/models/company.model.dart';
import 'package:empregonaarea/main.dart';
import 'package:empregonaarea/repositories/company/company.repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  @override
  Future<CompanyModel> getCompanyById(String companyId) async {
    try {
      final response = await supabase.from('company').select('*');

      final decodedCompany = response.map((response) => CompanyModel.fromMap(response)).toList();

      return decodedCompany.first;
    } catch (e) {
      throw Exception("Infelizmente não foi encontrado nenhuma companhia para esse id. Erro: $e");
    }
  }
}

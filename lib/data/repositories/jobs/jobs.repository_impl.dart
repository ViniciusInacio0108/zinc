import 'package:empregonaarea/data/models/jobs.model.dart';
import 'package:empregonaarea/main.dart';
import 'package:empregonaarea/data/repositories/jobs/jobs.repository.dart';

class JobsRepositoryImpl implements JobsRepository {
  @override
  Future<List<JobsModel>> getAllAvailableJobs() async {
    final response = await supabase.from("jobs").select("*");

    final decodedJobs = response.map((response) => JobsModel.fromMap(response)).toList();

    return decodedJobs;
  }
}

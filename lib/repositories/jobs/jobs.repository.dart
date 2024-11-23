import 'package:empregonaarea/data/models/jobs.model.dart';

abstract class JobsRepository {
  Future<List<JobsModel>> getAllAvailableJobs();
}

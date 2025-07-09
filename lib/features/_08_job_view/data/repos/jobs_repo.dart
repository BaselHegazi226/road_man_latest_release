import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../_06_home_view/data/model/job_model.dart';

abstract class JobsRepository {
  Future<Either<Failure, List<JobModel>>> getRecentJobs({
    required String token,
  });
}

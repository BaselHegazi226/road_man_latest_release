import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/job_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<JobModel>>> getRecommendedJobs({required String token});
}
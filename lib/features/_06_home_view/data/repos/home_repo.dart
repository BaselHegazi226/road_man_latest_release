import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/job_model.dart';
import '../model/notification_model.dart';
import '../model/progress_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<JobModel>>> getRecommendedJobs({
    required String token,
  });
  Future<Either<Failure, ProgressModel>> getProgress({required String token});
  Future<Either<Failure, List<NotificationModel>>> getAllNotification({
    required String token,
  });
}

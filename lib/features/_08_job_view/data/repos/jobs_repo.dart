import 'package:dartz/dartz.dart';
import 'package:road_man_project/features/_08_job_view/data/model/notification_model.dart';

import '../../../../core/error/failure.dart';
import '../../../_06_home_view/data/model/job_model.dart';

abstract class JobsRepository {
  Future<Either<Failure, List<JobModel>>> getRecentJobs({
    required String token,
  });
  Future<Either<Failure, List<NotificationModel>>> getAllNotification({
    required String token,
  });
}

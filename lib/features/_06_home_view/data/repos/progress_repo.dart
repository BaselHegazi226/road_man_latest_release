import 'package:dartz/dartz.dart';
import 'package:road_man_project/features/_06_home_view/data/model/progress_model.dart';

import '../../../../core/error/failure.dart';

abstract class ProgressRepository {
  Future<Either<Failure, ProgressModel>> getProgress({required String token});
}
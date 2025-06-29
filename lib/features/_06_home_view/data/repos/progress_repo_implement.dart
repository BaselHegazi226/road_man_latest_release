import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/features/_06_home_view/data/model/progress_model.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/progress_repo.dart';

import '../../../../core/error/failure.dart';

class ProgressRepoImplement implements ProgressRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://met2025-001-site1.anytempurl.com/api';

  @override
  Future<Either<Failure, ProgressModel>> getProgress({
    required String token,
  }) async {
    final String path = '$baseUrl/Recommendation/LearningPath/ProgressSummary';

    try {
      final response = await dio.get(
        path,
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        return Right(ProgressModel.fromJson(response.data));
      } else {
        return left(ServerFailure(errorMessage: 'Failed to fetch questions.'));
      }
    } on DioException catch (dioException) {
      log('DioException: ${dioException.message}');
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e) {
      log('Unexpected error: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
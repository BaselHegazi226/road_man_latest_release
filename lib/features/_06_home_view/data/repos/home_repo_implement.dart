import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo.dart';

import '../../../../core/error/failure.dart';
import '../model/job_model.dart';

class HomeRepoImplement implements HomeRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://met2025-001-site1.anytempurl.com/api';

  @override
  Future<Either<Failure, List<JobModel>>> getRecommendedJobs({
    required String token,
  }) async {
    final String path = '$baseUrl/Recommendation/Jobs';

    log('tokeeeeeen: $token');

    try {
      final response = await dio.get(
        path,
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );

      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        log('issssss $data');

        final jobs = data.map((jobJson) => JobModel.fromJson(jobJson)).toList();
        return Right(jobs);
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

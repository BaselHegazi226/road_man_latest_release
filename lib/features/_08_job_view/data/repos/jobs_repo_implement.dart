import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_06_home_view/data/model/job_model.dart';
import 'package:road_man_project/features/_08_job_view/data/model/notification_model.dart';

import 'jobs_repo.dart';

class JobsRepoImplement implements JobsRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://met2025-001-site1.anytempurl.com/api';

  @override
  Future<Either<Failure, List<JobModel>>> getRecentJobs({
    required String token,
  }) async {
    final String path = '$baseUrl/Recommendation/RecentJobs';

    try {
      final response = await dio.get(
        path,
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );

      print('Response status code: ${response.statusCode}');
      log('Response issdfefee: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];

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

  @override
  Future<Either<Failure, List<NotificationModel>>> getAllNotification({
    required String token,
  }) async {
    final String notificationPath = '$baseUrl/Notifications/All-Notifications';

    try {
      final response = await dio.get(
        notificationPath,
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        final notifications =
            data
                .map(
                  (json) =>
                      NotificationModel.fromJson(json as Map<String, dynamic>),
                )
                .toList();

        return Right(notifications);
      } else {
        return left(
          ServerFailure(errorMessage: 'Failed to fetch notifications.'),
        );
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

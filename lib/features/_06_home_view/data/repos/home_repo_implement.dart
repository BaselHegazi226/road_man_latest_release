import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/manager/tokens_manager.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo.dart';

import '../../../../core/error/failure.dart';
import '../model/job_model.dart';
import '../model/notification_model.dart';
import '../model/progress_model.dart';

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
        print('notifications from rrrrrrrrrrrrrrrrrrrrepo: $data');

        final notifications =
            data
                .map(
                  (json) =>
                      NotificationModel.fromJson(json as Map<String, dynamic>),
                )
                .toList();
        print(
          'notification lengthhhhhhhhhhhhhhhhhhhh : ${notifications.length}',
        );
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

  @override
  Future<Either<Failure, void>> deleteAllNotifications() async {
    final String path = '$baseUrl/Notifications/Delete-All-Notifications';

    try {
      final tokenModel = await SecureStorageHelper.getUserTokens();
      final response = await dio.delete(
        path,
        options: Options(
          headers: {'Authorization': "Bearer ${tokenModel!.token}"},
        ),
      );

      if (response.statusCode == 200) {
        return Right(null);
      } else {
        return left(
          ServerFailure(errorMessage: 'Failed to delete notifications'),
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

  @override
  Future<Either<Failure, void>> deleteNotificationById({
    required int id,
  }) async {
    final String path = '$baseUrl/Notifications/Notification/$id';

    try {
      final tokenModel = await SecureStorageHelper.getUserTokens();
      final response = await dio.delete(
        path,
        options: Options(
          headers: {'Authorization': "Bearer ${tokenModel!.token}"},
        ),
      );

      if (response.statusCode == 200) {
        print('${response.data}');
        return Right(null);
      } else {
        return left(
          ServerFailure(errorMessage: 'Failed to delete notification'),
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

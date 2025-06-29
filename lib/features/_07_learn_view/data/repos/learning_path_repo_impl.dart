import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/core/manager/user_learning_path_manager/user_learning_path_manager.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_completed_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learning_path_response.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo.dart';

import '../model/learn_path_lesson_model.dart';
import '../model/learn_path_model.dart';
import '../model/learn_path_quiz_model.dart';
import '../model/learn_path_user_answer_model.dart';

class LearningPathRepoImpl implements LearningPathRepo {
  final Dio dio = Dio();
  final String baseUrl = 'http://met2025-001-site1.anytempurl.com/api';
  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserLearningPath({
    required String userToken,
  }) async {
    final String learningPathPath = '$baseUrl/Recommendation/learning-path';
    try {
      final response = await dio.get(
        learningPathPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );
      print('Learning Path Data from impl = ${response.data.toString()}');

      if (response.statusCode == 200) {
        final learningPathResponse = LearningPathResponse.fromJson(
          response.data,
        );

        final List<LearnPathModel> paths = learningPathResponse.learningPath;

        // التخزين المحلي
        await getUserLearningPathLocal(paths: paths);

        // لو عايز ترجع البيانات الخام
        return right(response.data);
      } else {
        // ✅ هذا السطر كان ناقص
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode!,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LearnPathModel>>> getUserLearningPathLocal({
    required List<LearnPathModel> paths,
  }) async {
    try {
      // استخراج الدروس والاختبارات
      final allLessons = <LearnPathLessonModel>[];
      final allQuizzes = <LearnPathQuizModel>[];

      for (final path in paths) {
        allLessons.addAll(path.lessons);

        allQuizzes.add(path.quiz);
      }

      // التخزين المحلي
      await UserLearningPathHelper.saveLearningPaths(paths);
      await UserLearningPathHelper.saveLessons(allLessons);
      await UserLearningPathHelper.saveQuizzes(allQuizzes);

      // القراءة بعد التخزين
      final List<LearnPathModel> listOfPaths =
          UserLearningPathHelper.getAllLearningPaths();
      log('local data : $listOfPaths');
      log('local data length : ${listOfPaths.length}');
      return right(listOfPaths);
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> quizCompletedPost({
    required String userToken,
    required int id,
    required int questionsAnswered,
  }) async {
    final String quizCompletedPostPath =
        '$baseUrl/Recommendation/Quiz/$id/Complete?answeredCount=$questionsAnswered';
    try {
      final response = await dio.post(
        quizCompletedPostPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );
      log('Response Data: ${response.data}');
      log('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        log('dataaaaaaaaaaaaaaaaaaaaaaa : ${response.data}');
        return right(true);
      } else {
        print(
          '${ServerFailure.fromResponse(statusCode: response.statusCode, responseData: response.data)}',
        );
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      print('Dio Ex : ${dioException.message}');
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      print('errooooooooooooor : $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> quizCompletedGet({
    required String userToken,
    required int quizId,
  }) async {
    final String quizCompletedGetPath =
        '$baseUrl/Recommendation/IsQuiz/$quizId/Completed';
    try {
      final response = await dio.get(
        quizCompletedGetPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );
      log('Response Data: ${response.data}');
      log('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> lessonCompletedPost({
    required String userToken,
    required int id,
  }) async {
    final String lessonCompletedPath =
        '$baseUrl/Recommendation/lessons/$id/complete';
    try {
      final response = await dio.post(
        lessonCompletedPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );
      print('Learning Path Data from impl = $response');

      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> lessonCompletedGet({
    required String userToken,
    required int id,
  }) async {
    final String lessonCompletedPath =
        '$baseUrl/Recommendation/lessons/$id/is-completed';
    try {
      final response = await dio.get(
        lessonCompletedPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );
      print('Lesson completed From impl = $response');

      if (response.statusCode == 200) {
        final learnPathLessonCompletedModel =
            LearnPathLessonCompletedModel.fromJson(response.data);
        return right(learnPathLessonCompletedModel.toJson());
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  //

  @override
  Future<Either<Failure, List<LearnPathUserAnswerModel>>>
  getLocalUserQuizAnswers(int quizId) async {
    try {
      final localAnswers = UserLearningPathHelper.getAllUserAnswers();
      final userAnswers =
          localAnswers.where((e) => e.quizId == quizId).toList();
      return right(userAnswers);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

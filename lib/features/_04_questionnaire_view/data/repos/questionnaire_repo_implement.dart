// questionnaire_repo_implement.dart
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_04_questionnaire_view/data/repos/questionnaire_repo.dart';

import '../model/question_model.dart';
import '../model/questionnaire_response_model.dart';

class QuestionnaireRepoImplement implements QuestionnaireRepo {
  final Dio dio = Dio();
  final String baseUrl = 'http://met2025-001-site1.anytempurl.com/api';

  @override
  Future<Either<Failure, List<QuestionModel>>> fetchAllQuestions() async {
    final String path = '$baseUrl/Questionnaire';

    try {
      final response = await dio.get(path);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        log(data.toString());

        final questions =
            data
                .map((questionJson) => QuestionModel.fromJson(questionJson))
                .toList();
        return right(questions);
      } else {
        return left(ServerFailure(errorMessage: 'Failed to fetch questions.'));
      }
    } on DioException catch (dioException) {
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuestionModel>> fetchQuestionByPageNumber({
    required int pageNumber,
  }) async {
    final String path = '$baseUrl/Questionnaire';
    final Map<String, dynamic> queryParams = {'pageNumber': pageNumber};
    try {
      final response = await dio.get(path, queryParameters: queryParams);

      if (response.statusCode == 200) {
        final questionJson = response.data;
        print('fetchQuestionByPageNumber $questionJson');
        final question = QuestionModel.fromJson(questionJson);
        return right(question);
      } else {
        return left(
          ServerFailure(
            errorMessage: 'Failed to fetch question for page $pageNumber.',
          ),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> submitQuestionnaire({
    required List<QuestionnaireResponseModel> responses,
    required String token,
  }) async {
    final String path = '$baseUrl/Recommendation';

    try {
      final Map<String, dynamic> requestBody = {
        'userAnswers': responses.map((r) => r.toJson()).toList(),
      };

      if (kDebugMode) {
        log('answwers ${requestBody.toString()}');
      }
      final response = await dio.post(
        path,
        options: Options(headers: {'Authorization': "Bearer $token"}),
        data: requestBody,
      );

      if (kDebugMode) {
        log("Response data: ${response.data}");
      }

      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(
          ServerFailure(errorMessage: 'Failed to submit questionnaire.'),
        );
      }
    } on DioException catch (dioException) {
      print('Dio Exep in submitQuestionnaire ${dioException.message}');
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e, s) {
      print('Error in submitQuestionnaire: ${e.toString()}');
      print(s);
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> checkQuestionnaireAnswered({
    required String token,
  }) async {
    final String path = '$baseUrl/Accounts/check-questionnaire-answered';
    try {
      final response = await dio.get(
        path,
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );

      if (kDebugMode) {
        print('Response data: ${response.data}');
      }

      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(
          ServerFailure(errorMessage: 'Failed to check questionnaire answered'),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e, s) {
      if (kDebugMode) {
        print(s);
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:road_man_project/core/error/failure.dart';

import '../model/question_model.dart';
import '../model/questionnaire_response_model.dart';

abstract class QuestionnaireRepo {
  Future<Either<Failure, List<QuestionModel>>> fetchAllQuestions();

  Future<Either<Failure, QuestionModel>> fetchQuestionByPageNumber({
    required int pageNumber,
  });

  Future<Either<Failure, void>> submitQuestionnaire({
    required List<QuestionnaireResponseModel> responses,
    required String token,
  });

  Future<Either<Failure, void>> checkQuestionnaireAnswered({
    required String token,
  });
}

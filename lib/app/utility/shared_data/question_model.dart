import 'package:master_linux_mcq_app/app/utility/utility_exports.dart';

class QuestionModel {
  final String questionId;
  final String question;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.questionId,
    required this.question,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        questionId: json["questionID"],
        question: json["question"],
        answers: AnswerModel.getListOfAnswers(json["answers"]),
      );

  static List<QuestionModel> getListOfQuestions(List<dynamic> list) =>
      list.map((json) => QuestionModel.fromJson(json)).toList();
}

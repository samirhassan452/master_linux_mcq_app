class AnswerModel {
  final String answerId;
  final String answer;
  final int score;

  AnswerModel({
    required this.answerId,
    required this.answer,
    required this.score,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        answerId: json['answerID'],
        answer: json['answer'],
        score: json['score'],
      );

  static List<AnswerModel> getListOfAnswers(List<dynamic> list) =>
      list.map((json) => AnswerModel.fromJson(json)).toList();
}

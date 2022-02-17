import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show AnswerModel, Constants, CustomElevatedButtonWidget;

class AnswersWidget extends StatelessWidget {
  final List<AnswerModel> answers;
  final bool isLastQuestion;
  final void Function(int, bool) calculateScore;
  const AnswersWidget({
    Key? key,
    required this.answers,
    required this.isLastQuestion,
    required this.calculateScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: answers
          .map((answer) => Padding(
                padding: const EdgeInsets.only(bottom: Constants.smallPadding),
                child: CustomElevatedButtonWidget(
                  btnPressed: () =>
                      calculateScore(answer.score, isLastQuestion),
                  btnText: answer.answer,
                ),
              ))
          .toList(),
    );
  }
}

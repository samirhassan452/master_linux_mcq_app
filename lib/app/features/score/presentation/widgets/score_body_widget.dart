import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show Constants, CustomTextWidget;

class ScoreBodyWidget extends StatelessWidget {
  final int score;
  final String studentName;
  const ScoreBodyWidget({
    Key? key,
    required this.score,
    required this.studentName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextWidget(
            "Your score is: $score/100",
            textAlign: TextAlign.center,
            fontSize: 22.0,
          ),
          Constants.verticalSpaceLarge,
          CustomTextWidget(
            _getScoreResult(),
            textAlign: TextAlign.center,
            fontSize: 18.0,
          ),
        ],
      ),
    );
  }

  String _getScoreResult() {
    if (score >= 80) {
      return 'You are awesome. $studentName!';
    } else if (score >= 60) {
      return 'Pretty likeable. $studentName!';
    } else if (score >= 40) {
      return 'You need to work more. $studentName!';
    } else if (score >= 20) {
      return 'You need to work hard. $studentName!';
    } else {
      return 'This is a poor score. $studentName!';
    }
  }
}

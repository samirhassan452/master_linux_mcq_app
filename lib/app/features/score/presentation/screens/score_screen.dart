import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/features/score/score_exports.dart'
    show ScoreBodyWidget, ScoreHeaderWidget;
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show CustomPopUpsWidgets, RoutesNames;

class ScoreScreen extends StatelessWidget {
  final int score;
  final String studentName;
  const ScoreScreen({
    Key? key,
    required this.score,
    required this.studentName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomPopUpsWidgets.showCloseAppMessageDialog(
        primaryText: 'Re-test',
        primaryAction: () => Navigator.of(context).pushReplacementNamed(
          RoutesNames.questionsRoute,
          arguments: studentName,
        ),
        secondaryText: 'Close',
        secondaryAction: () => Navigator.of(context).pop(true),
      ),
      child: Scaffold(
        appBar: ScoreHeaderWidget(studentName: studentName),
        body: ScoreBodyWidget(
          score: score,
          studentName: studentName,
        ),
      ),
    );
  }
}

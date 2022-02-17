import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/features/questions/questions_exports.dart'
    show QuestionsBodyWidget, QuestionsHeaderWidget;
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show CustomPopUpsWidgets;

class QuestionsScreen extends StatelessWidget {
  final String studentName;
  const QuestionsScreen({Key? key, required this.studentName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => CustomPopUpsWidgets.showCloseAppMessageDialog(),
      child: Scaffold(
        appBar: const QuestionsHeaderWidget(),
        body: QuestionsBodyWidget(studentName: studentName),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show AppColors, CustomHorizontalSpace, CustomTextWidget;

class QuestionCardWidget extends StatelessWidget {
  final String question;
  final int questionIndex;
  const QuestionCardWidget({
    Key? key,
    required this.question,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          "Q$questionIndex.",
          fontColor: AppColors.black.withOpacity(0.8),
        ),
        const CustomHorizontalSpace(width: 5.0),
        Expanded(
          child: CustomTextWidget(
            question,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}

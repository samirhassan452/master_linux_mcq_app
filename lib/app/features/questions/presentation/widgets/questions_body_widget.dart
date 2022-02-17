import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/features/questions/questions_exports.dart'
    show AnswersWidget, QuestionCardWidget;
import 'package:master_linux_mcq_app/app/features/score/score_exports.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show
        Constants,
        GlowingScrollWidget,
        QuestionModel,
        RoutesNames,
        defaultConfiguration;

class QuestionsBodyWidget extends StatefulWidget {
  final String studentName;
  const QuestionsBodyWidget({
    Key? key,
    required this.studentName,
  }) : super(key: key);

  @override
  State<QuestionsBodyWidget> createState() => _QuestionsBodyWidgetState();
}

class _QuestionsBodyWidgetState extends State<QuestionsBodyWidget> {
  late List<QuestionModel> _listOfQuestions;
  late PageController _pageController;
  late int _maxScore;

  @override
  void initState() {
    super.initState();
    _listOfQuestions = QuestionModel.getListOfQuestions(
      defaultConfiguration["Questions"],
    );
    _listOfQuestions.shuffle();

    _pageController = PageController();
    // _randomListOfQuestions =

    _maxScore = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _listOfQuestions.length,
      itemBuilder: (_, index) {
        final question = _listOfQuestions[index];
        final answers = question.answers;
        answers.shuffle();
        return GlowingScrollWidget(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              vertical: Constants.largePadding,
              horizontal: Constants.mediumPadding,
            ),
            children: [
              // question
              QuestionCardWidget(
                question: question.question,
                questionIndex: index + 1,
              ),
              Constants.verticalSpaceMedium,
              // answers
              AnswersWidget(
                calculateScore: _calculateScore,
                answers: answers,
                isLastQuestion: index == _listOfQuestions.length - 1,
              ),
            ],
          ),
        );
      },
    );
  }

  void _calculateScore(int score, bool isLastQuestion) {
    _maxScore = _maxScore + score;
    if (isLastQuestion) {
      Navigator.of(context).pushReplacementNamed(
        RoutesNames.scoreRoute,
        arguments:
            ScoreScreen(score: _maxScore, studentName: widget.studentName),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

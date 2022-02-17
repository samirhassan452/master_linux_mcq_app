import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/features/error/error_exports.dart'
    show NotFoundScreen;
import 'package:master_linux_mcq_app/app/features/questions/questions_exports.dart'
    show QuestionsScreen;
import 'package:master_linux_mcq_app/app/features/score/score_exports.dart'
    show ScoreScreen;
import 'package:master_linux_mcq_app/app/features/student_info/student_info_exports.dart'
    show StudentInfoScreen;
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show RoutesNames;

class Routers {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SizedBox(),
        );
      case RoutesNames.studentInfoRoute:
        return MaterialPageRoute(
          builder: (_) => const StudentInfoScreen(),
        );
      case RoutesNames.questionsRoute:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => QuestionsScreen(studentName: args),
        );
      case RoutesNames.scoreRoute:
        final args = settings.arguments as ScoreScreen;
        return MaterialPageRoute(
          builder: (_) => ScoreScreen(
            score: args.score,
            studentName: args.studentName,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}

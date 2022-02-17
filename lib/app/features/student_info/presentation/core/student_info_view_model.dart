import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show CustomPopUpsWidgets, NavigationService, RoutesNames;

class StudentInfoViewModel {
  final GlobalKey<FormState> formKey;
  final TextEditingController studentInfoController;

  StudentInfoViewModel({
    required this.formKey,
    required this.studentInfoController,
  });

  void dispose() {
    studentInfoController.clear();
    studentInfoController.dispose();
  }

  void submitButton() {
    final context = NavigationService.navigatorKey.currentContext!;
    if (!formKey.currentState!.validate()) {
      CustomPopUpsWidgets.showWarningMessageDialog(
        'should pass the requirements!',
      );
      return;
    }

    Navigator.of(context).pushReplacementNamed(
      RoutesNames.questionsRoute,
      arguments: studentInfoController.text.trim(),
    );
  }

  void onFieldSubmitted() {
    FocusManager.instance.primaryFocus?.unfocus();
    submitButton();
  }

  String? onValidate(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return 'please enter your name.';
      } else if (value.length < 2) {
        return 'your name is too short';
      } else if (value.length > 25) {
        return 'your name is much long';
      } else {
        return null;
      }
    }
  }
}

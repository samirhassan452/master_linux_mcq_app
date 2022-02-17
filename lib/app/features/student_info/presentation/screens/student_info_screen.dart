import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/features/student_info/student_info_exports.dart'
    show StudentInfoBodyWidget, StudentInfoHeaderWidget;
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show AppColors, CustomPopUpsWidgets;

class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () async => CustomPopUpsWidgets.showCloseAppMessageDialog(),
        child: const Scaffold(
          backgroundColor: AppColors.white2,
          appBar: StudentInfoHeaderWidget(),
          body: StudentInfoBodyWidget(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/features/student_info/student_info_exports.dart'
    show StudentInfoViewModel;
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show
        Constants,
        CustomElevatedButtonWidget,
        CustomTextFieldWidget,
        GlowingScrollWidget;

class StudentInfoBodyWidget extends StatefulWidget {
  const StudentInfoBodyWidget({Key? key}) : super(key: key);

  @override
  _StudentInfoBodyWidgetState createState() => _StudentInfoBodyWidgetState();
}

class _StudentInfoBodyWidgetState extends State<StudentInfoBodyWidget> {
  late TextEditingController _studentNameController;
  late GlobalKey<FormState> _formKey;
  late StudentInfoViewModel _studentInfoViewModel;

  @override
  void initState() {
    super.initState();
    _studentNameController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _studentInfoViewModel = StudentInfoViewModel(
      formKey: _formKey,
      studentInfoController: _studentNameController,
    );
  }

  @override
  void dispose() {
    _studentInfoViewModel.dispose();
    // to close the keyboard if still open
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GlowingScrollWidget(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.semiMediumPadding,
          vertical: height / 4.0,
        ),
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // text-field
          Form(
            key: _formKey,
            child: CustomTextFieldWidget(
              controller: _studentNameController,
              label: 'Student Name',
              labelSize: 15.0,
              hintText: 'Enter your name...',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
              onFieldSubmitted: (_) => _studentInfoViewModel.onFieldSubmitted(),
              validator: (value) => _studentInfoViewModel.onValidate(value),
            ),
          ),
          // button
          CustomElevatedButtonWidget(
            btnPressed: () => _studentInfoViewModel.submitButton(),
            btnText: 'Confirm',
          ),
        ],
      ),
    );
  }
}

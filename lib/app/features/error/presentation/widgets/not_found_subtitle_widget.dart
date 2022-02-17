import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show CustomTextWidget;

class NotFoundSubTitleWidget extends StatelessWidget {
  const NotFoundSubTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTextWidget(
      "Opps, this page does not exist, try again later",
      fontColor: Colors.black54,
      textAlign: TextAlign.center,
      height: 1.1,
    );
  }
}

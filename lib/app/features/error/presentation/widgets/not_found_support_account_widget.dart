import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show CustomTextWidget, FONT_WEIGHT;

class NotFoundSupportAccountWidget extends StatelessWidget {
  const NotFoundSupportAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTextWidget(
      "support@facegraph.com",
      fontColor: Colors.black45,
      fontWeight: FONT_WEIGHT.bold,
      fontSize: 18.0,
    );
  }
}

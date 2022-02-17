import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show CustomTextWidget, FONT_WEIGHT;

class AppBarHeaderTitle extends StatelessWidget {
  final String title;
  const AppBarHeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
      title,
      fontColor: Colors.white,
      fontWeight: FONT_WEIGHT.bold,
      fontSize: 20.0,
      letterSpacing: 0.8,
    );
  }
}

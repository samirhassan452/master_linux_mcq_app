import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show AppBarHeaderTitle;

class StudentInfoHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;
  const StudentInfoHeaderWidget({Key? key, this.height = kToolbarHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppBarHeaderTitle(title: "Welcome"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

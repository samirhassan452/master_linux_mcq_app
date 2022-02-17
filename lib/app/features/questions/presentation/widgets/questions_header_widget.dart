import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show AppBarHeaderTitle;

class QuestionsHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;
  const QuestionsHeaderWidget({Key? key, this.height = kToolbarHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppBarHeaderTitle(title: 'Flutter Questions'),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show
        AppBarHeaderTitle,
        AppColors,
        Constants,
        CustomIconButtonWidget,
        CustomPopUpsWidgets,
        RoutesNames;

class ScoreHeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String studentName;
  const ScoreHeaderWidget({
    Key? key,
    this.height = kToolbarHeight,
    required this.studentName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const AppBarHeaderTitle(title: 'Score'),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.smallPadding,
          ),
          child: CustomIconButtonWidget(
            btnPressed: () async =>
                CustomPopUpsWidgets.showCloseAppMessageDialog(
              primaryText: 'Re-test',
              primaryAction: () => Navigator.of(context).pushReplacementNamed(
                RoutesNames.questionsRoute,
                arguments: studentName,
              ),
              secondaryText: 'Close',
              secondaryAction: () => Navigator.of(context).pop(true),
            ),
            materialIcon: Icons.close,
            materialIconColor: AppColors.white,
            materialIconSize: 24.0,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

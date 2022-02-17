import 'package:flutter/material.dart';
import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show AppColors, NavigationService, Routers, RoutesNames;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "MCQ",
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: AppColors.darkTurquoise,
        ),
      ),
      initialRoute: RoutesNames.studentInfoRoute,
      onGenerateRoute: Routers.allRoutes,
    );
  }
}

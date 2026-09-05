import 'package:flutter/material.dart';
import 'package:sudhar_portfolio/app/app.bottomsheets.dart';
import 'package:sudhar_portfolio/app/app.dialogs.dart';
import 'package:sudhar_portfolio/app/app.locator.dart';
import 'package:sudhar_portfolio/app/app.router.dart';
import 'package:sudhar_portfolio/core/constants/app_theme.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudharsanan D • Full-Stack Developer | Flutter Specialist',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}


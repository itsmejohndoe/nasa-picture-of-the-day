import 'package:flutter/material.dart';

import 'di.dart' as di;
import 'shared/navigation/app_router.dart';
import 'shared/resources/app_colors.dart';
import 'shared/resources/app_dimens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();

  runApp(NasaPicturesApp());
}

class NasaPicturesApp extends StatelessWidget {
  final _appRouter = AppRouter();

  NasaPicturesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nasa APOD',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF222782,
          <int, Color>{
            50: Color(0xFFE4E5F0),
            100: Color(0xFFBDBEDA),
            200: Color(0xFF9193C1),
            300: Color(0xFF6468A8),
            400: Color(0xFF434795),
            500: AppColors.primaryColor,
            600: Color(0xFF1E237A),
            700: Color(0xFF191D6F),
            800: Color(0xFF141765),
            900: Color(0xFF0C0E52),
          },
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius),
          ),
        ),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

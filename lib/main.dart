import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/config/routes_management.dart';
import 'package:flutter_divar_clone_bloc/core/config/theme_management.dart';
import 'package:flutter_divar_clone_bloc/core/utils/storages/shared_preferences_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


void main()  {
  SharedPreferencesManager().preferences;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'),
        ],
        locale: const Locale("fa"),
        title: 'Divar',
        theme: ThemeManagement.lightTheme,
        routes: RouteManagement.routes,
      ),
    );
  }
}

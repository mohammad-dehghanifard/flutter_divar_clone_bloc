import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/auth_page.dart';
import 'package:flutter_divar_clone_bloc/features/splash/presentation/views/splash_page.dart';

class RouteManagement {
  RouteManagement._();

  static Map<String, Widget Function(BuildContext)> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    AuthPage.routeName: (context) => const AuthPage(),
  };
}
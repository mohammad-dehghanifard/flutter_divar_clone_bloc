import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/auth_view.dart';
import 'package:flutter_divar_clone_bloc/features/splash/presentation/views/splash_view.dart';

class RouteManagement {
  RouteManagement._();

  static Map<String, Widget Function(BuildContext)> routes = {
      SplashView.routeName : (context) => const SplashView(),
      AuthView.routeName : (context) => const AuthView(),
  };
}
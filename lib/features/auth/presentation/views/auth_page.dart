import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/auth_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  static String routeName = "/auth";

  @override
  Widget build(BuildContext context) {
    return const AuthView();
  }
}

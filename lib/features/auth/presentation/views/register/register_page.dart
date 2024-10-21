import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/register/register_view.dart';

class RegisterPage extends StatelessWidget {
  static String routeName = "/register";
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterView();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/register/register_view.dart';

class RegisterPage extends StatelessWidget {
  static String routeName = "/register";
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
      child: const RegisterView(),
    );
  }
}

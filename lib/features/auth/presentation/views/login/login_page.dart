import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/login/login_view.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginView(),
    ) ;
  }
}

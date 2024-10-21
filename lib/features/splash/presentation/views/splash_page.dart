import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/splash/presentation/views/splash_view.dart';

class SplashPage extends StatelessWidget {
  static String routeName = "/";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: const SplashView(),
    );
  }
}

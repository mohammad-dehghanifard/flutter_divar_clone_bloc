import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/views/home_view.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

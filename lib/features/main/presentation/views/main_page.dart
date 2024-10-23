import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/views/main_view.dart';

class MainPage extends StatelessWidget {
  static String routeName = "/mainWrapper";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: const MainView());
  }
}

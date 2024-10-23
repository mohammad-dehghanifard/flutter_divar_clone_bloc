import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/views/home_view.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

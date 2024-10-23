import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/views/main_view.dart';

class MainPage extends StatelessWidget {
  static String routeName = "/mainWrapper";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainView();
  }
}

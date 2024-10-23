import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/views/home_page.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const TestView(color: Colors.blue),
      const TestView(color: Colors.redAccent),
      const TestView(color: Colors.green),
    ];
    return  Scaffold(
        body: PageView(
          children: pages,
        ),
    );
  }
}


class TestView extends StatelessWidget {
  const TestView({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color,
    );
  }
}


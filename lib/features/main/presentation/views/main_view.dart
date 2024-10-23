import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/views/home_page.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/widgets/custom_navigation_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final List<Widget> pages = [
      const HomePage(),
      const TestView(color: Colors.blue),
      const TestView(color: Colors.redAccent),
      const TestView(color: Colors.green),
    ];
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        final NavigationCubit navCubit = BlocProvider.of<NavigationCubit>(context);
        return Scaffold(
          bottomNavigationBar: CustomNavigationBar(
            selectedPage: state, 
            onItemTap: (int pageIndex) {
              navCubit.changePageIndex(pageIndex);
              pageController.animateToPage(pageIndex, duration: const Duration(milliseconds: 250), curve: Curves.linear);
            },
          ),
          body: PageView(
            controller: pageController,
            children: pages,
          ),
        );
      },
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


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/search/search_page.dart';
import 'package:flutter_divar_clone_bloc/features/category/presentation/views/category_page.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/views/home_page.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/widgets/custom_navigation_bar.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/profile_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final List<Widget> pages = [
      const HomePage(),
      const CategoryPage(),
      const SearchPage(),
      const ProfileView(),
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
            physics: const NeverScrollableScrollPhysics(),
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


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/search/search_page.dart';
import 'package:flutter_divar_clone_bloc/features/category/presentation/views/category_page.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/views/home_page.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/widgets/custom_navigation_bar.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/profile/profile_page.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const CategoryPage(),
      const SearchPage(),
      const ProfilePage(),
    ];
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        final NavigationCubit navCubit = BlocProvider.of<NavigationCubit>(context);
        return Scaffold(
          bottomNavigationBar: CustomNavigationBar(
            selectedPage: state,
            onItemTap: (int pageIndex) {
              navCubit.changePageIndex(pageIndex);
            },
          ),
          body: IndexedStack(
            index: state,
            children: pages,
          )
        );
      },
    );
  }
}



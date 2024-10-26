import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/category/presentation/cubit/category_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/category/presentation/views/category_view.dart';

class CategoryPage extends StatelessWidget {
  static String routeName = "/categories";
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoryCubit(),
         child: const CategoryView(),
    );
  }
}

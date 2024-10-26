import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/features/category/presentation/cubit/category_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/category/presentation/cubit/category_status.dart';
import 'package:flutter_divar_clone_bloc/features/category/presentation/widgets/category_list_item_widget.dart';


class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  @override
  void initState() {
    BlocProvider.of<CategoryCubit>(context).fetchCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit,CategoryState>(
        builder: (context, state) {
          if(state.categoryStatus is CategoryLoadDataStatus) {
            return const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CircularProgressIndicator(),
            );
          } else if(state.categoryStatus is CategoryLoadDataSuccessStatus) {
            final categoryList = (state.categoryStatus as CategoryLoadDataSuccessStatus).categories;
            return Padding(
              padding: const EdgeInsets.all(Distances.bodyMargin),
              child: ListView.builder(
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) => CategoryListItemWidget(category: categoryList[index], onTap: () {  },),
              ),
            );

          }
          else {
            throw Exception("state invalid...");
          }
        },
        listener: (context, state) {

        },);
  }
}


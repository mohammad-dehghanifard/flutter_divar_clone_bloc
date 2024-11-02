import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/load_image_network.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectCategoryBottomSheetWidget extends StatelessWidget {
  const SelectCategoryBottomSheetWidget({
    super.key,
    required this.categories, required this.onTap,
  });

  final List<CategoryModel> categories;
  final Function(CategoryModel category) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            categories.length,
                (index) {
              return ListTile(
                splashColor: UiColors.primaryColor.withOpacity(0.50),
                onTap: () => onTap(categories[index]),
                title: Text(categories[index].name!,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700)),
                leading: LoadNetworkImage(imageUrl: categories[index].image!),
              );
            },),
        ),
      ),
    );
  }
}
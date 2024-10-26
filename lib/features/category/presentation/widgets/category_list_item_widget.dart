import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/load_image_network.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryListItemWidget extends StatelessWidget {
  const CategoryListItemWidget({
    super.key,
    required this.category, required this.onTap,
  });

  final CategoryModel category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.w),
        margin: EdgeInsets.only(bottom: 2.5.w),
        decoration: BoxDecoration(
          color: UiColors.whiteColor,
          borderRadius: BorderRadius.circular(4.w),
        ),
        child: Row(
          children: [
            LoadNetworkImage(imageUrl: category.image!),
            SizedBox(width: 2.w),
            Text(category.name!,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16.sp),),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}

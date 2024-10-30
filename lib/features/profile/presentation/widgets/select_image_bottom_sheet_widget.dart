import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectImageBottomSheetWidget extends StatelessWidget {
  const SelectImageBottomSheetWidget({super.key, required this.fromCameraTap, required this.fromGalleryTap});
  final VoidCallback fromCameraTap,fromGalleryTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Distances.bodyMargin),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            // from gallery
            GestureDetector(
              onTap: fromGalleryTap,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 15.w,
                    height: 15.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.w),
                      border: Border.all(color: UiColors.primaryColor)
                    ),
                    child: Icon(Icons.image_outlined,color: UiColors.primaryColor.withOpacity(0.50),),
                  ),
                  SizedBox(height: 2.w),
                  Text("انتخاب از گالری",style: TextStyle(fontSize: 14.sp,color: UiColors.greyTextColor))
                ],
              ),
            ),
            // in camera
            GestureDetector(
              onTap: fromCameraTap,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 15.w,
                    height: 15.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.w),
                        border: Border.all(color: UiColors.primaryColor)
                    ),
                    child: Icon(Icons.camera_alt_outlined,color: UiColors.primaryColor.withOpacity(0.50),),
                  ),
                  SizedBox(height: 2.w),
                  Text("گرفتن عکس جدید",style: TextStyle(fontSize: 14.sp,color: UiColors.greyTextColor))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

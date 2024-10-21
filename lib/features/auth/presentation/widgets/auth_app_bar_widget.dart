import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthAppBarWidget extends StatelessWidget {
  const AuthAppBarWidget({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w900,color: UiColors.blackTextColor)),
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_forward,color: UiColors.primaryColor))
      ],
    );
  }
}

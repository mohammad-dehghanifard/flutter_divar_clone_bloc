import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.mode = ButtonMode.fill, required this.onTap, required this.text,
  });
  final ButtonMode mode;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(0),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity,12.w)),
            backgroundColor: WidgetStatePropertyAll(mode == ButtonMode.fill ? UiColors.primaryColor : Colors.transparent),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.5.w),
                side: mode == ButtonMode.border ? const BorderSide(color: UiColors.primaryColor,width: 2) : BorderSide.none,
              )
            )
        ),
        onPressed: onTap,
        child: Text(text,style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w900,
          color: mode == ButtonMode.fill ? UiColors.whiteColor : UiColors.primaryColor
        ),));
  }
}


enum ButtonMode {fill,border}
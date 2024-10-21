import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashView extends StatelessWidget {
  static String routeName = "/";
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // app name
    final Widget appNameText = Text("اپلیکیشن آگهی نیاز",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w900,color: UiColors.primaryColor));
    // app Description
    final Widget appDescriptionText = Text("هرچی بخوای رو تو نیاز پیدا میکنی!",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: UiColors.greyTextColor));
    // loading widget
    final Widget loading = LoadingAnimationWidget.staggeredDotsWave(
      size: 8.w,
      color: UiColors.primaryColor,
    );

    return  Scaffold(
      body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                appNameText,
                appDescriptionText,
                const Spacer(),
                loading,
                SizedBox(height: 4.w)
              ],
            ),
          )
      ),
    );
  }
}

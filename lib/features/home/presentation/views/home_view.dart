import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget appBar = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 3.w),
      decoration: BoxDecoration(
        color: UiColors.whiteColor,
        boxShadow: [
          BoxShadow(color: UiColors.blackColor.withOpacity(0.40),blurRadius: 10,offset: const Offset(0, -5))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // sort ads
          GestureDetector(
            onTap: () {

            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svgs.sort),
                const Text("جدیدترین",style: TextStyle(fontWeight: FontWeight.w700,color: UiColors.primaryColor),)
              ],
            ),
          ),
          Text("اپلیکیشن نیاز",style: TextStyle(fontSize: 18.sp,color: UiColors.primaryColor,fontWeight: FontWeight.w900),),
          // city
          GestureDetector(
            onTap: () {

            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svgs.location),
                const Text("بوشهر",style: TextStyle(fontWeight: FontWeight.w700,color: UiColors.primaryColor),)
              ],
            ),
          )
        ],
      ),
    );
    return  SafeArea(
      child: Column(
        children: [
          appBar
        ],
      ),
    );
  }
}

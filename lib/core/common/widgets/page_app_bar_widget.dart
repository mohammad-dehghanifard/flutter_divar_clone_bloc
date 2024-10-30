import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class PageAppBarWidget extends StatelessWidget implements PreferredSize  {
  const PageAppBarWidget({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              Assets.svgs.arrowLeft,
              colorFilter: const ColorFilter.mode(UiColors.primaryColor, BlendMode.srcIn),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size(double.infinity, 15.w);
}
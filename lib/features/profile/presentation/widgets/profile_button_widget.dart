import 'package:flutter/cupertino.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({super.key, required this.onTap, required this.imagePath, required this.text});
  final VoidCallback onTap;
  final String imagePath,text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: UiColors.whiteColor,
        borderRadius: BorderRadius.circular(4.w),
        boxShadow: [
          BoxShadow(
            color: UiColors.blackColor.withOpacity(0.20),
            blurRadius: 10,
            offset: const Offset(0, 5)
          )
        ]
      ),
      child: Row(

        children: [
          SvgPicture.asset(imagePath),
          SizedBox(width: 2.w),
          Text(text,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w900)),
          const Spacer(),
          Transform.rotate(
            angle: 1.6,
            child:  SvgPicture.asset(Assets.svgs.arrowDown),
          )
        ],
      ),
    );
  }
}

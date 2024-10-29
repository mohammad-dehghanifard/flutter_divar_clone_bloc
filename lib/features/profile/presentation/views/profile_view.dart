import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/widgets/profile_button_widget.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProfileButtonWidget> profileButtons = [
      ProfileButtonWidget(
        onTap: () {  },
        imagePath: Assets.svgs.userEdit,
        text: 'ویرایش پروفایل',
      ),
      ProfileButtonWidget(
        onTap: () {  },
        imagePath: Assets.svgs.myAds,
        text: 'آگهی های من',
      ),
      ProfileButtonWidget(
        onTap: () {  },
        imagePath: Assets.svgs.bookmark,
        colorFilter: const ColorFilter.mode(UiColors.primaryColor, BlendMode.srcIn),
        text: 'نشان ها',
      ),
      ProfileButtonWidget(
        onTap: () {  },
        imagePath: Assets.svgs.logout,
        text: 'خروج از حساب',
      ),

    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Distances.bodyMargin),
        child: Column(
          children: [
            // user image,
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                color: UiColors.greyColor
              ),
            ),
            SizedBox(height: 4.w),
            // username
            Text("محمد دهقانی فرد",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w900)),
            SizedBox(height: 6.w),
            Column(
              children: List.generate(
                  profileButtons.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 4.w),
                    child: ProfileButtonWidget(
                        onTap: profileButtons[index].onTap,
                        imagePath:  profileButtons[index].imagePath,
                        text:  profileButtons[index].text,
                        colorFilter: profileButtons[index].colorFilter,
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

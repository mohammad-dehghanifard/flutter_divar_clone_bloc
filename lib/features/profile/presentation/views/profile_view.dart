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
            ProfileButtonWidget(
              onTap: () {  },
              imagePath: Assets.svgs.userEdit,
              text: 'ویرایش پروفایل',
            )
          ],
        ),
      ),
    );
  }
}

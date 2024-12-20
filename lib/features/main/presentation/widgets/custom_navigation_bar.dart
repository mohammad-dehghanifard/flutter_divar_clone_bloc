import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/create/create_ads_page.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.selectedPage, required this.onItemTap});
  final int selectedPage;
  final Function(int pageIndex) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 21.w,
      decoration: BoxDecoration(
          color: UiColors.whiteColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(6.w),
            topLeft: Radius.circular(6.w),
          ),
          boxShadow: [
            BoxShadow(
                color: UiColors.blackColor.withOpacity(0.20),
                offset: const Offset(0, 2),
                blurRadius: 10)
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItemWidget(
              iconPath: Assets.svgs.home,
              label: "خانه",
              isActive: selectedPage == 0,
              onTap: () => onItemTap(0)
          ),
          _NavItemWidget(
              iconPath: Assets.svgs.category,
              label: "دسته بندی ها",
              isActive: selectedPage == 1,
              onTap: () => onItemTap(1)),
          _AddNewAdsButton(
            onTap: () {
              Navigator.pushNamed(context, CreateAdsPage.routeName);
            },
          ),
          _NavItemWidget(
              iconPath: Assets.svgs.search,
              label: "جست و جو",
              isActive: selectedPage == 2,
              onTap: () => onItemTap(2)),
          _NavItemWidget(
              iconPath: Assets.svgs.user,
              label: "پروفایل",
              isActive: selectedPage == 3,
              onTap: () => onItemTap(3)),
        ],
      ),
    );
  }
}

class _AddNewAdsButton extends StatelessWidget {
  const _AddNewAdsButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 12.w,
        height: 12.w,
        decoration: BoxDecoration(
            color: UiColors.primaryColor,
            borderRadius: BorderRadius.circular(2.5.w)),
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: SvgPicture.asset(Assets.svgs.addSquare),
        ),
      ),
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  const _NavItemWidget(
      {required this.iconPath,
      required this.label,
      required this.isActive,
      required this.onTap});

  final String iconPath, label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                  isActive
                      ? UiColors.primaryColor
                      : UiColors.deActiveNavBarItemColor,
                  BlendMode.srcIn),
            ),
            SizedBox(height: 1.w),
            Text(
              label,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isActive
                      ? UiColors.primaryColor
                      : UiColors.deActiveNavBarItemColor),
            ),
          ],
        ),
      ),
    );
  }
}

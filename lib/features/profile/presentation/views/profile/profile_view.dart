import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/user_model.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/load_image_network.dart';
import 'package:flutter_divar_clone_bloc/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/profile_status.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/edit_profile/edit_user_page.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/widgets/profile_button_widget.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  void initState() {
    /// api call
    BlocProvider.of<ProfileCubit>(context).fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Distances.bodyMargin),
        child: BlocConsumer<ProfileCubit,ProfileState>(
            builder: (context, state) {
              if(state.profileStatus is ProfileDataLoading) {
                return const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if(state.profileStatus is ProfileLoadDataSuccess) {
                final UserModel user = (state.profileStatus as ProfileLoadDataSuccess).user;
                // profile button list
                final List<ProfileButtonWidget> profileButtons = [
                  ProfileButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, EditUserPage.routeName,arguments: user);
                    },
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
                return Column(
                  children: [
                    // user image,
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.w),
                          color: UiColors.greyColor
                      ),
                      child: LoadNetworkImage(imageUrl: user.avatar ?? ""),
                    ),
                    SizedBox(height: 4.w),
                    // username
                    Text(user.name ?? "",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w900)),
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
                );
              } else {
                throw Exception("state invalid...");
              }
            },
            listener: (context, state) {
              if(state.profileStatus is ProfileLoadDataError) {
                final errorMessage = (state.profileStatus as ProfileLoadDataError).errorMessage;
                showCustomSnackBar(context: context, snackBar: showSnackBarWidget(message: errorMessage));
              }
            },)
      ),
    );
  }
}

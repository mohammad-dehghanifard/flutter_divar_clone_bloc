import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    // app name
    final Widget appNameText = Text("اپلیکیشن آگهی نیاز",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w900,color: UiColors.primaryColor));
    // app Description
    final Widget appDescriptionText = Text("هرچی بخوای رو تو نیاز پیدا میکنی!",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: UiColors.greyTextColor));
    // login btn
    final Widget loginButton = CustomButtonWidget(onTap: () {  }, text: 'ورود',);
    // register btn
    final Widget registerButton = CustomButtonWidget(mode: ButtonMode.border, onTap: () {  }, text: 'ساخت حساب کاربری',);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Distances.bodyMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                appNameText,
                appDescriptionText,
                const Spacer(),
                loginButton,
                SizedBox(height: 4.w),
                registerButton

              ],
            ),
          )
      ),
    );
  }
}


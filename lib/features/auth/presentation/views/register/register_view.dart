import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/login/login_page.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/widgets/auth_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    // app bar
    const Widget appBar = AuthAppBarWidget(title: "ثبت نام");
    // input username widget
    final Widget usernameTextField = TextFieldWidget(hintText: "نام کاربری",iconPath: Assets.svgs.user);
    // input phone number widget
    final Widget mobileNumberTextField = TextFieldWidget(hintText: "شماره موبایل",iconPath: Assets.svgs.mobile);
    // select city and province cards
    final Widget selectProvinceAndCityCards = Row(
      children: [
        Expanded(child: TextFieldWidget(hintText: "استان",readOnly: true,iconPath: Assets.svgs.arrowDown)),
        SizedBox(width: 4.w),
        Expanded(child: TextFieldWidget(hintText: "شهر",readOnly: true,iconPath: Assets.svgs.arrowDown)),
      ],
    );
    // input address widget
    const Widget addressTextField = TextFieldWidget(hintText: "آدرس",maxLines: 3);
    // input password widget
    const Widget passWordTextField = TextFieldWidget(hintText: "رمز عبور",keyboardType: TextInputType.visiblePassword);
    // input repeat pass widget
    const Widget repeatPassWordTextField = TextFieldWidget(hintText: "تکرار رمز عبور",keyboardType: TextInputType.visiblePassword);
    // register btn
    final Widget registerBtn = CustomButtonWidget(onTap: () {}, text: "ثبت نام");
    // login account message
    final Widget loginAccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("حساب کاربری دارید؟",style: TextStyle(fontSize: 16.sp,color: UiColors.blackTextColor,fontWeight: FontWeight.w900),),
        TextButton(onPressed: () {
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        }, child: Text("وارد شوید!",style: TextStyle(fontSize: 16.sp,color: UiColors.primaryColor,fontWeight: FontWeight.w900)))
      ],
    );

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Distances.bodyMargin),
            child: SingleChildScrollView(
              child: Column(
                children: [
                    appBar,
                  SizedBox(height: 8.w),
                  usernameTextField,
                  SizedBox(height: 4.w),
                  mobileNumberTextField,
                  SizedBox(height: 4.w),
                  selectProvinceAndCityCards,
                  SizedBox(height: 4.w),
                  addressTextField,
                  SizedBox(height: 4.w),
                  passWordTextField,
                  SizedBox(height: 4.w),
                  repeatPassWordTextField,
                  SizedBox(height: 4.w),
                  registerBtn,
                  SizedBox(height: 4.w),
                  loginAccount
                ],
              ),
            ),
          )
      ),
    );
  }
}

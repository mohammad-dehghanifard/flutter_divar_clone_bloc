import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/register/register_page.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/widgets/auth_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // app bar
    const Widget appBar = AuthAppBarWidget(title: "ورود");
    // input phone number widget
    final Widget phoneNumberTextField = TextFieldWidget(hintText: "شماره موبایل",iconPath: Assets.svgs.mobile,);
    // input password widget
    const Widget passWordTextField = TextFieldWidget(hintText: "رمز عبور",keyboardType: TextInputType.visiblePassword);
    // login btn
    final Widget loginBtn = CustomButtonWidget(onTap: () {}, text: "ورود");
    // create account message
    final Widget createAccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("حساب کاربری ندارید؟",style: TextStyle(fontSize: 16.sp,color: UiColors.blackTextColor,fontWeight: FontWeight.w900),),
        TextButton(onPressed: () {
          Navigator.pushReplacementNamed(context, RegisterPage.routeName);
        }, child: Text("ثبت نام کنید!",style: TextStyle(fontSize: 16.sp,color: UiColors.primaryColor,fontWeight: FontWeight.w900)))
      ],
    );

    return  Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Distances.bodyMargin),
            child: Column(
              children: [
               appBar,
                SizedBox(height: 8.w),
                phoneNumberTextField,
                SizedBox(height: 4.w),
                passWordTextField,
                SizedBox(height: 4.w),
                loginBtn,
                SizedBox(height: 4.w),
                createAccount
              ],
            ),
          )
      ),
    );
  }
}


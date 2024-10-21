import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/widgets/auth_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    const Widget appBar = AuthAppBarWidget(title: "ورود");
    final Widget phoneNumberTextField = TextFieldWidget(hintText: "شماره موبایل",iconPath: Assets.svgs.mobile,);
    final Widget passWordTextField = TextFieldWidget(hintText: "رمز عبور",keyboardType: TextInputType.visiblePassword);
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
                passWordTextField
              ],
            ),
          )
      ),
    );
  }
}


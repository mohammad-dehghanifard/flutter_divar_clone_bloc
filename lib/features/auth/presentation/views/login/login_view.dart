import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    const Widget appBar = AuthAppBarWidget(title: "ورود");
    return const Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Distances.bodyMargin),
            child: Column(
              children: [
               appBar
              ],
            ),
          )
      ),
    );
  }
}

class AuthAppBarWidget extends StatelessWidget {
  const AuthAppBarWidget({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w900,color: UiColors.blackTextColor)),
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_forward,color: UiColors.primaryColor))
      ],
    );
  }
}

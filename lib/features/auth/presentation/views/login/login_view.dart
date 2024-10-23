import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/requests/login_request.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/cubit/login/login_status.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/register/register_page.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/widgets/auth_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/views/home_page.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final LoginRequest loginRequest = LoginRequest();
    // app bar
    const Widget appBar = AuthAppBarWidget(title: "ورود");
    // input phone number widget
    final Widget phoneNumberTextField = TextFieldWidget(
      controller: loginRequest.mobileTextController,
      validator: loginRequest.validateMobileNumber,
      hintText: "شماره موبایل",
      iconPath: Assets.svgs.mobile,);
    // input password widget
    final Widget passWordTextField = TextFieldWidget(
        controller: loginRequest.passWordTextController,
        validator: loginRequest.validatePassWord,
        hintText: "رمز عبور",
        keyboardType: TextInputType.visiblePassword);
    // login btn
    final Widget loginBtn = BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        bool loading = false;
        if(state.loginStatus is LoginLoadingButton) {
          loading = (state.loginStatus as LoginLoadingButton).isLoading;
        }
        return CustomButtonWidget(
            onTap: () {
              if(formKey.currentState!.validate()){
                BlocProvider.of<LoginCubit>(context).login(request: loginRequest);
              }
            },
            loading: loading,
            text: "ورود");
      },
    );
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

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(Distances.bodyMargin),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if(state.loginStatus is LoginError) {
              final errorMessage = (state.loginStatus as LoginError).errorMessage;
              showCustomSnackBar(context: context, snackBar: showSnackBarWidget(message: errorMessage,mode: SnackBarMode.error));
            } else if(state.loginStatus is LoginSuccess) {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
              showCustomSnackBar(context: context, snackBar: showSnackBarWidget(message: "با موفقیت وارد شدید!"));

            }
          },
          builder: (context, state) {
            if(state.loginStatus is LoginInitial || state.loginStatus is LoginLoadingButton) {
              return Column(
                children: [
                  appBar,
                  SizedBox(height: 8.w),
                  Form(
                    key: formKey,
                      child: Column(
                    children: [
                      phoneNumberTextField,
                      SizedBox(height: 4.w),
                      passWordTextField, 
                    ],
                  )),
                  SizedBox(height: 4.w),
                  loginBtn,
                  SizedBox(height: 4.w),
                  createAccount
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      )),
    );
  }
}

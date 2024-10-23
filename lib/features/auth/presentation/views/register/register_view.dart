import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/province_and_city_bottom_sheet_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/requests/register_request.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/cubit/register/register_status.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/login/login_page.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/widgets/auth_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {


  @override
  void initState() {
    /// api call
    BlocProvider.of<RegisterCubit>(context).fetchProvinces();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final RegisterRequest registerRequest = RegisterRequest();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // app bar
    const Widget appBar = AuthAppBarWidget(title: "ثبت نام");
    // input username widget
    final Widget usernameTextField = TextFieldWidget(controller: registerRequest.userNameTextController,validator: registerRequest.validateUserName,hintText: "نام کاربری",iconPath: Assets.svgs.user);
    // input phone number widget
    final Widget mobileNumberTextField = TextFieldWidget(controller: registerRequest.mobileTextController,validator: registerRequest.validateMobileNumber,hintText: "شماره موبایل",iconPath: Assets.svgs.mobile);
    // select city and province cards
    final Widget selectProvinceAndCityCards = BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
                child: TextFieldWidget(
                    onTap: () {
                      if(state.registerStatus is RegisterPageLoadingCompletedStatus) {
                        final currentState = state.registerStatus as RegisterPageLoadingCompletedStatus;
                        showModalBottomSheet(context: context, builder: (context) {
                          return ProvinceAndCityBottomSheetWidget(provinceList: currentState.provinces);
                        },);
                      }
                    },
                    hintText: "استان",
                    readOnly: true,
                    iconPath: Assets.svgs.arrowDown)),
            SizedBox(width: 4.w),
            Expanded(
                child: TextFieldWidget(
                    hintText: "شهر",
                    readOnly: true,
                    iconPath: Assets.svgs.arrowDown)),
          ],
        );
      },
    );
    // input address widget
    final Widget addressTextField = TextFieldWidget(controller: registerRequest.addressTextController,validator: registerRequest.validateAddress,hintText: "آدرس",maxLines: 3);
    // input password widget
    final Widget passWordTextField = TextFieldWidget(controller: registerRequest.passWordTextController,validator: registerRequest.validatePassWord,hintText: "رمز عبور",keyboardType: TextInputType.visiblePassword);
    // input repeat pass widget
    final Widget repeatPassWordTextField = TextFieldWidget(controller: registerRequest.confirmPassWordTextController,validator: registerRequest.validateRepeatPassWord,hintText: "تکرار رمز عبور",keyboardType: TextInputType.visiblePassword);
    // register btn
    final Widget registerBtn = CustomButtonWidget(onTap: () {
      if(formKey.currentState!.validate()) {

      }
    }, text: "ثبت نام");
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
              child: BlocConsumer<RegisterCubit, RegisterState>(

                listener: (context, state) {
                  if(state.registerStatus is RegisterPageLoadingErrorStatus) {
                    Navigator.pop(context);
                  }
                },
                 builder: (context, state) {
                    if(state.registerStatus is RegisterLoadingPageStatus) {
                      return const Center(child: CircularProgressIndicator());
                    } else if(state.registerStatus is RegisterPageLoadingCompletedStatus) {
                      return Column(
                        children: [
                          appBar,
                          SizedBox(height: 8.w),
                          Form(
                              key: formKey,
                              child: Column(
                                children: [
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
                                ],
                              )),
                          SizedBox(height: 4.w),
                          registerBtn,
                          SizedBox(height: 4.w),
                          loginAccount
                        ],
                      );
                    } else {
                      throw Exception("state invalidate...");
                    }
            },
          ),
        ),
          )
      ),
    );
  }
}


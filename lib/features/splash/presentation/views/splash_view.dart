import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/splash/presentation/cubit/splash_status.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    BlocProvider.of<SplashCubit>(context).loadingSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // app name
    final Widget appNameText = Text("اپلیکیشن آگهی نیاز",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w900,color: UiColors.primaryColor));
    // app Description
    final Widget appDescriptionText = Text("هرچی بخوای رو تو نیاز پیدا میکنی!",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: UiColors.greyTextColor));
    // loading widget
    final Widget loading = LoadingAnimationWidget.staggeredDotsWave(
      size: 8.w,
      color: UiColors.primaryColor,
    );

    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if(state.splashStatus is SplashLoadingCompleted) {
              BlocProvider.of<SplashCubit>(context).navigateToNextPage(context: context);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              appNameText,
              appDescriptionText,
              const Spacer(),
              loading,
              SizedBox(height: 4.w)
            ],
          ),
        ),
      )),
    );
  }
}

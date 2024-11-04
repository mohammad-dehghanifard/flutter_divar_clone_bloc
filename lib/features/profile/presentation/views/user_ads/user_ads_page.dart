import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/user_ads/user_ads_view.dart';

class UserAdsPage extends StatelessWidget {
  static String routeName = "/userAdsPage";
  const UserAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: const UserAdsView(),
    );
  }
}

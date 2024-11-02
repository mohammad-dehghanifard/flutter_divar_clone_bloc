import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/create/create_ads_view.dart';

class CreateAdsPage extends StatelessWidget {
  static String routeName = "/createAds";
  const CreateAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AdsCubit(),
        child: const CreateAdsView(),
    );
  }
}

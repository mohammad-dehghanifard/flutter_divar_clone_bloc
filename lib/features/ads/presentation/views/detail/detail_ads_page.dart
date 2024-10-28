import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/detail/detail_ads_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/detail/detail_ads_view.dart';
import 'package:flutter_divar_clone_bloc/features/ads/repositories/ads_repository.dart';

class DetailAdsPage extends StatelessWidget {
  static String routeName = "/adsDetail";
  const DetailAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ads id
    final id = ModalRoute.of(context)!.settings.arguments as int;
    late AdsRepository adsRepository;
    return BlocProvider(
      create: (context) => DetailAdsCubit(),
      child: DetailAdsView(adsId: id),
    );
  }
}

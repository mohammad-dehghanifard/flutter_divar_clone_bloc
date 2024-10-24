import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/detail_ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/detail/detail_ads_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/detail/detail_ads_status.dart';

class DetailAdsView extends StatefulWidget {
  const DetailAdsView({super.key, required this.adsId});
  final int adsId;

  @override
  State<DetailAdsView> createState() => _DetailAdsViewState();
}

class _DetailAdsViewState extends State<DetailAdsView> {

  @override
  void initState() {
    BlocProvider.of<DetailAdsCubit>(context).fetchDetailAdsData(adsId: widget.adsId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<DetailAdsCubit,DetailAdsState>(
          builder: (context, state) {
            if(state.detailAdsStatus is DetailAdsLoadData) {
              return const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if(state.detailAdsStatus is DetailAdsLoadDataSuccess) {
              final DetailAdsModel ads = (state.detailAdsStatus as DetailAdsLoadDataSuccess).ads;
              return Text(ads.title!);
            } else {
              throw Exception("state invalid...");
            }
          },
      ),
    );
  }
}

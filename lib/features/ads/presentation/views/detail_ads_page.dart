import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/detail_ads_view.dart';

class DetailAdsPage extends StatelessWidget {
  static String routeName = "/adsDetail";
  const DetailAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ads id
    final id = ModalRoute.of(context)!.settings.arguments as int;
    return  DetailAdsView(adsId: id);
  }
}

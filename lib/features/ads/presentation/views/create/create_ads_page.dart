import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/create/create_ads_view.dart';

class CreateAdsPage extends StatelessWidget {
  static String routeName = "/createAds";
  const CreateAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateAdsView();
  }
}

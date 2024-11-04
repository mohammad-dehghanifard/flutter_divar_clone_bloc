import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/ads_list/ads_list_view.dart';

class AdsListPage extends StatelessWidget {
  static String routeName = "/adsList";
  const AdsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AdsCubit(),
        child: const AdsListView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/params/ads_params.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_status.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/widgets/ads_list_item_widget.dart';

class AdsListView extends StatefulWidget {
  const AdsListView({super.key, required this.adsParams});
  final AdsParams adsParams;

  @override
  State<AdsListView> createState() => _AdsListViewState();
}

class _AdsListViewState extends State<AdsListView> {
  
  @override
  void initState() {
    BlocProvider.of<AdsCubit>(context).getAllAds(params: widget.adsParams);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBarWidget(title: "لیست آگهی ها"),
      body: BlocConsumer<AdsCubit,AdsState>(
          builder: (context, state) {
            if(state.adsStatus is AdsLoading) {
              return const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if(state.adsStatus is AdsLoadDataCompleted) {
              final List<AdsModel> adsList = (state.adsStatus as AdsLoadDataCompleted).adsList;
              return ListView.builder(
                itemCount: adsList.length,
                  itemBuilder: (context, index) => AdsListItemWidget(ads: adsList[index]),
              );
            } else {
              throw Exception("state invalid...");
            }
          }, 
          listener: (context, state) {
            if(state.adsStatus is AdsError) {
              Navigator.pop(context);
              final errorMessage = (state.adsStatus as AdsError).errorMessage;
              showCustomSnackBar(context: context, snackBar: showSnackBarWidget(message: errorMessage,mode: SnackBarMode.error));
            }
          },),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/widgets/ads_list_item_widget.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/user_ads_status.dart';

class UserAdsView extends StatefulWidget {
  const UserAdsView({super.key});

  @override
  State<UserAdsView> createState() => _UserAdsViewState();
}

class _UserAdsViewState extends State<UserAdsView> {

  @override
  void initState() {
    /// api call
    BlocProvider.of<ProfileCubit>(context).getAllUserAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBarWidget(title: "آگهی های منتشر شده شما"),
      body: BlocConsumer<ProfileCubit,ProfileState>(
          builder: (context, state) {
            if(state.userAdsStatus is UserAdsLoadingStatus) {
              return const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if(state.userAdsStatus is UserAdsLoadDataSuccessStatus) {
              final List<AdsModel> adsList = (state.userAdsStatus as UserAdsLoadDataSuccessStatus).adsList;
              return ListView.builder(
                   itemCount: adsList.length,
                  itemBuilder: (context, index) => AdsListItemWidget(ads: adsList[index]),
              );
            } else {
              throw Exception("state invalid...");
            }
          },
          listener: (context, state) {
          if(state.userAdsStatus is UserAdsErrorStatus) {
            Navigator.pop(context);
            final errorMessage = (state.userAdsStatus as UserAdsErrorStatus).errorMessage;
            showCustomSnackBar(context: context, snackBar: showSnackBarWidget(message: errorMessage,mode: SnackBarMode.error));
          }
          },),
    );
  }
}

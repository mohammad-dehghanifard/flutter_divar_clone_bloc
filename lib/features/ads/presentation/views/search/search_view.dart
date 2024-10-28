import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/params/ads_params.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_search_status.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/widgets/ads_list_item_widget.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final AdsParams adsParams = AdsParams();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Distances.bodyMargin),
        child: BlocConsumer<AdsCubit, AdsState>(
          listener: (context, state) {
            if(state.searchStatus is AdsSearchError) {
              final errorMessage = (state.searchStatus as AdsSearchError).errorMessage;
              showCustomSnackBar(context: context, snackBar: showSnackBarWidget(message: errorMessage,mode: SnackBarMode.error));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  controller: searchController,
                  onChanged: (String? searchText) {
                    adsParams.searchKeyWord = searchText;
                    BlocProvider.of<AdsCubit>(context).getAdsByKeyWord(params: adsParams);
                  },
                  hintText: "محصول مورد نظر خود را جستجو کنید",
                  iconPath: Assets.svgs.search,
                  iconColor: const ColorFilter.mode(
                      UiColors.primaryColor, BlendMode.srcIn),
                ),
                // init page
                if(state.searchStatus is AdsSearchInitial)...[
                  const Spacer(),
                  const Text("محصول مورد نظر خود را به راحتی پیدا کنید!"),
                  const Spacer(),
                ],


                if(state.searchStatus is AdsSearchLoading)...[
                  const Spacer(),
                  const CircularProgressIndicator(),
                  const Spacer(),
                ],


                if(state.searchStatus is AdsSearchLoadDataCompleted)...[
                  Expanded(
                    child: (state.searchStatus as AdsSearchLoadDataCompleted).adsList.isNotEmpty ? ListView.builder(
                      itemCount: (state.searchStatus as AdsSearchLoadDataCompleted).adsList.length,
                        itemBuilder: (context, index) {
                          AdsModel ads = (state.searchStatus as AdsSearchLoadDataCompleted).adsList[index];
                          return Padding(
                            padding:  EdgeInsets.only(bottom: 6.w,top: index == 0 ? 4.5.w : 0),
                            child: AdsListItemWidget(ads: ads,margin: 0),
                          );
                        },
                    ) : Text("متاسفانه نتیجه ای برای ( ${adsParams.searchKeyWord} ) یافت نشد!"),
                  )

                ]
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/params/ads_params.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final AdsParams adsParams = AdsParams();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Distances.bodyMargin),
        child: Column(
          children: [
            TextFieldWidget(
              controller: searchController,
              onChanged: (String? searchText) {
                adsParams.searchKeyWord = searchText;
              },
              hintText: "محصول مورد نظر خود را جستجو کنید",
              iconPath: Assets.svgs.search,
              iconColor: const ColorFilter.mode(UiColors.primaryColor, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }
}

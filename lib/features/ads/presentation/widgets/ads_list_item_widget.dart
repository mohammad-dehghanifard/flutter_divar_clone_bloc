import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/load_image_network.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/detail/detail_ads_page.dart';
import 'package:flutter_divar_clone_bloc/gen/fonts.gen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdsListItemWidget extends StatelessWidget {
  const AdsListItemWidget({
    super.key,
    required this.ads,
    this.margin = Distances.bodyMargin,
  });

  final AdsModel ads;
  final double margin;

  @override
  Widget build(BuildContext context) {


    // loading widget
    final Widget loading = LoadingAnimationWidget.staggeredDotsWave(
      size: 8.w,
      color: UiColors.primaryColor,
    );

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context,DetailAdsPage.routeName,arguments: ads.id),
      child: Container(
        margin:  EdgeInsets.all(margin),
        width: double.infinity,
        decoration: BoxDecoration(
            color: UiColors.whiteColor,
            boxShadow: [
              BoxShadow(color: UiColors.blackColor.withOpacity(0.15),blurRadius: 10,offset: const Offset(0, 5))
            ],
            borderRadius: BorderRadius.circular(4.w)
        ),
        child: Row(
          children: [
            // ads image
            SizedBox(
              width: 30.w,
              height: 30.w,
              child: LoadNetworkImage(
                loadingWidget: loading,
                  radius: BorderRadius.only(
                    topRight: Radius.circular(4.w),
                    bottomRight: Radius.circular(4.w),
                  ),
                  imageUrl: ads.image!
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ads title
                  SizedBox(
                      width: 50.w,
                      child: Text(
                          ads.title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: UiColors.blackTextColor))),
                  SizedBox(height: 2.w),
                  // ads price
                  RichText(
                      text: TextSpan(
                          text: ads.price,
                          style: const TextStyle(
                            fontFamily: FontFamily.yekanBakh,
                            fontSize: 16,
                            color: UiColors.blackTextColor,
                          ),
                          children: const [
                            TextSpan(
                              text: "  تومان",
                              style: TextStyle(
                                fontFamily: FontFamily.yekanBakh,
                                fontSize: 16,
                                color: UiColors.greyTextColor,
                              ),
                            )
                          ]
                      )
                  ),
                  SizedBox(height: 8.w),
                  // ads time and city
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ads.city!),
                        Text(ads.createdAt!),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
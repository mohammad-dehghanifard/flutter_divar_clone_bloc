import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/load_image_network.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/detail_ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/detail/detail_ads_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/detail/detail_ads_status.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:flutter_divar_clone_bloc/gen/fonts.gen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      bottomNavigationBar: BlocBuilder<DetailAdsCubit, DetailAdsState>(
        builder: (context, state) {
          if (state.detailAdsStatus is DetailAdsLoadDataSuccess) {
            final DetailAdsModel ads = (state.detailAdsStatus as DetailAdsLoadDataSuccess).ads;
            return Padding(
              padding:  EdgeInsets.only(bottom: 4.w ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButtonWidget(
                      width: 45,
                      onTap: () {
                        showModalBottomSheet(context: context, builder: (context) {
                          return GetContactInfoBottomSheetWidget(
                            address: ads.contactInfo!.address!,
                            mobileNumber: ads.contactInfo!.mobile!,
                          );
                        },);
                      },
                      text: "اطلاعات تماس"),
                ],
              ),
            );
          }else if(state.detailAdsStatus is DetailAdsLoadData) {
            return const SizedBox();
          } else {
            throw Exception("state invalid...");
          }
        },
      ),
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
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(Distances.bodyMargin),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // image and action
                        Stack(
                          children: [
                            // ads image
                            SizedBox(
                              width: 100.w,
                              height: 80.w,
                              child: LoadNetworkImage(
                                radius: BorderRadius.circular(4.w),
                                  imageUrl: ads.image!,
                              ),
                            ),
                            // actions
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _DetailActionButton(onTap: () { },imagePath: Assets.svgs.bookmark),
                                  _DetailActionButton(onTap: () => Navigator.pop(context),imagePath: Assets.svgs.arrowLeft),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 2.5.w),
                        Text(ads.title!,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16.sp)),
                        SizedBox(height: 8.w,),
                        // description ads
                        Text("توضیحات",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16.sp)),
                        SizedBox(height: 2.w),
                        Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: UiColors.whiteColor,
                            borderRadius: BorderRadius.circular(3.w),
                            boxShadow: [
                              BoxShadow(
                                color: UiColors.blackColor.withOpacity(0.15),
                                blurRadius: 15,
                                offset: const Offset(0, 5)
                              )
                            ]
                          ),
                          child: Text(ads.description!,style: const TextStyle(color: UiColors.greyTextColor),),
                        ),
                        // price
                        SizedBox(height: 4.w),
                        Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                              color: UiColors.whiteColor,
                              borderRadius: BorderRadius.circular(3.w),
                              boxShadow: [
                                BoxShadow(
                                    color: UiColors.blackColor.withOpacity(0.15),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5)
                                )
                              ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("قیمت",style: TextStyle(fontSize: 16.sp,color: UiColors.greyTextColor)),
                              RichText(
                                  text: TextSpan(
                                      text: ads.price,
                                      style:  TextStyle(
                                        fontFamily: FontFamily.yekanBakh,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: UiColors.blackTextColor,
                                      ),
                                      children:  [
                                        TextSpan(
                                          text: "  تومان",
                                          style: TextStyle(
                                            fontFamily: FontFamily.yekanBakh,
                                            fontSize: 14.sp,
                                            color: UiColors.greyTextColor,
                                          ),
                                        )
                                      ]
                                  )
                              ),
                            ],
                          )),

                      ],
                    ),
                  ),
                ),
              );
            } else {
              throw Exception("state invalid...");
            }
          },
      ),
    );
  }
}

class _DetailActionButton extends StatelessWidget {
  const _DetailActionButton({
    required this.imagePath, required this.onTap,
  });

  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 10.w,
        height: 10.w,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          color: UiColors.whiteColor
        ),
        child: SvgPicture.asset(imagePath),
      ),
    );
  }
}

class GetContactInfoBottomSheetWidget extends StatelessWidget {
  const GetContactInfoBottomSheetWidget({super.key, required this.mobileNumber, required this.address});
  final String mobileNumber,address;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.w),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.cancel_outlined,color: UiColors.primaryColor,))),
          
          
          Text("شماره موبایل",style: TextStyle(fontSize: 16.sp,color: UiColors.greyTextColor)),
          SizedBox(height: 2.w),
          Text(mobileNumber,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700)),


          Text("آدرس",style: TextStyle(fontSize: 16.sp,color: UiColors.greyTextColor)),
          SizedBox(height: 2.w),
          Text(address,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700)),

        ],
      ),
    );
  }
}

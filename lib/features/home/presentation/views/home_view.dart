import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/load_image_network.dart';
import 'package:flutter_divar_clone_bloc/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/cubit/home_status.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:flutter_divar_clone_bloc/gen/fonts.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).fetchHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // app bar
    final Widget appBar = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
      decoration: BoxDecoration(
        color: UiColors.whiteColor,
        boxShadow: [
          BoxShadow(
              color: UiColors.blackColor.withOpacity(0.40),
              blurRadius: 10,
              offset: const Offset(0, -5))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // sort ads
          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svgs.sort),
                const Text(
                  "جدیدترین",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: UiColors.primaryColor),
                )
              ],
            ),
          ),
          Text(
            "اپلیکیشن نیاز",
            style: TextStyle(
                fontSize: 18.sp,
                color: UiColors.primaryColor,
                fontWeight: FontWeight.w900),
          ),
          // city
          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svgs.location),
                const Text(
                  "بوشهر",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: UiColors.primaryColor),
                )
              ],
            ),
          )
        ],
      ),
    );
    final Widget adsList = BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
      if(state.homeStatus is HomeLoadDataSuccessStatus) {
        final List<AdsModel> adsList = (state.homeStatus as HomeLoadDataSuccessStatus).adsList;
        return Expanded(
            child: ListView.builder(
                itemCount: adsList.length,
                itemBuilder: (context, index) {
                  return AdsListItemWidget(ads: adsList[index]);
                },
            )
        );
      }else {
        throw Exception("state inValid.....");
      }
    },);
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if(state.homeStatus is HomeLoadDataErrorStatus) {
            final errorMessage = (state.homeStatus as HomeLoadDataErrorStatus).errorMessage;
            showCustomSnackBar(context: context, snackBar: showSnackBarWidget(message: errorMessage,mode: SnackBarMode.error));
          }
        },
        builder: (context, state) {
          if(state.homeStatus is HomeLoadDataStatus) {
            return const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: CircularProgressIndicator(),),
            );
          } else if(state.homeStatus is HomeLoadDataSuccessStatus) {
            return Column(
              children: [
                appBar,
                adsList
              ],
            );
          } else {
            throw Exception("state inValid.....");
          }
        },
      ),
    );
  }
}

class AdsListItemWidget extends StatelessWidget {
  const AdsListItemWidget({
    super.key,
    required this.ads,
  });

  final AdsModel ads;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Distances.bodyMargin),
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
    );
  }
}

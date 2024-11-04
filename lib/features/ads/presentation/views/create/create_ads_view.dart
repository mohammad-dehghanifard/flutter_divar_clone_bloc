import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/province_and_city_bottom_sheet_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/select_image_bottom_sheet_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/requests/create_ads_request.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/create_ads_status.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/widgets/select_category_bottom_sheet_widget.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateAdsView extends StatefulWidget {
  const CreateAdsView({super.key});

  @override
  State<CreateAdsView> createState() => _CreateAdsViewState();
}

class _CreateAdsViewState extends State<CreateAdsView> {

  @override
  void initState() {
    BlocProvider.of<AdsCubit>(context).getCategoriesAndProvinces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CreateAdsRequest createAdsRequest = CreateAdsRequest();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<AdsCubit, AdsState>(
      listener: (context, state) {
        if(state.createAdsStatus is CreateAdsErrorStatus) {
          Navigator.pop(context);
          final errorMessage = (state.createAdsStatus as CreateAdsErrorStatus).errorMessage;
          showCustomSnackBar(context: context, snackBar: showSnackBarWidget(message: errorMessage,mode: SnackBarMode.error));
        }

        if(state.createAdsStatus is CreateAdsSuccessStatus) {
          Navigator.pop(context);
          showCustomSnackBar(
              context: context,
              snackBar: showSnackBarWidget(
                  message: "آگهی شما پس از تایید مدیریت منتشر خواهد شد!",));

        }
      },
      builder: (context, state) {
        final adsCubit = BlocProvider.of<AdsCubit>(context);
        return Scaffold(
          appBar: const PageAppBarWidget(title: "ایجاد آگهی"),
          bottomNavigationBar: (state.createAdsStatus is CreateAdsLoadDataSuccessStatus)? Padding(
            padding: const EdgeInsets.all(Distances.bodyMargin),
            child: CustomButtonWidget(
                onTap: () {
                  if(formKey.currentState!.validate()) {
                    if(createAdsRequest.cityId == null) {
                      showCustomSnackBar(
                          context: context,
                          snackBar: showSnackBarWidget(
                              message: "لطفا استان و شهر را انتخاب کنید",
                              mode: SnackBarMode.error));
                    } else if(createAdsRequest.categoryId == null) {
                      showCustomSnackBar(
                          context: context,
                          snackBar: showSnackBarWidget(
                              message: "لطفا دسته بندی اگهی خود را مشخص کنید",
                              mode: SnackBarMode.error));
                    } else if(createAdsRequest.image == null) {
                      showCustomSnackBar(
                          context: context,
                          snackBar: showSnackBarWidget(
                              message: "لطفا یک عکس برای آگهی خود انتخاب کنید",
                              mode: SnackBarMode.error));
                    } else {
                      adsCubit.createNewAds(request: createAdsRequest);
                    }
                  }
                },
                text: "ثبت آگهی"),
          ) : null,
          body: Padding(
            padding: const EdgeInsets.all(Distances.bodyMargin),
            child: SingleChildScrollView(
              child:  (state.createAdsStatus is CreateAdsLoadDataSuccessStatus)? Column(
                children: [
                  // ads image
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SelectImageBottomSheetWidget(
                          fromCameraTap: () async {
                            Navigator.pop(context);
                            createAdsRequest.image = await adsCubit.changeImage(source: ImageSource.camera);
                          },
                          fromGalleryTap: () async {
                            Navigator.pop(context);
                            createAdsRequest.image = await adsCubit.changeImage(source: ImageSource.gallery);
                          }
                        ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 75.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.w),
                          color: UiColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: UiColors.borderColor.withOpacity(0.10),
                                blurRadius: 15,
                                offset: const Offset(0, 5)
                            )
                          ]
                      ),
                      child: (state.createAdsStatus as CreateAdsLoadDataSuccessStatus).image == null ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 32.w,
                              color: UiColors.greyColor),
                          Text("انتخاب عکس آگهی", style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w700))
                        ],
                      ) : ClipRRect(
                        borderRadius: BorderRadius.circular(4.w),
                          child: Image.file(File((state.createAdsStatus as CreateAdsLoadDataSuccessStatus).image!.path),fit: BoxFit.cover,)),
                    ),
                  ),
                  SizedBox(height: 8.w),
                  // forms
                  Form(
                    key: formKey,
                      child: Column(
                        children: [
                          // ads title
                          TextFieldWidget(
                            controller: createAdsRequest.adsTitleTxt,
                            validator: createAdsRequest.validateAdsTitle,
                            hintText: "عنوان اگهی را وارد کنید",
                          ),
                          SizedBox(height: 4.w),
                          TextFieldWidget(
                            controller: createAdsRequest.adsPriceTxt,
                            validator: createAdsRequest.validateAdsPrice,
                            hintText: "مبلغ آگهی را وارد کنید",
                          ),
                          SizedBox(height: 4.w),
                          // ads category
                          TextFieldWidget(
                            controller: createAdsRequest.adsCategoryTxt,
                            onTap: () {
                              var categories = (state.createAdsStatus as CreateAdsLoadDataSuccessStatus).categories;
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SelectCategoryBottomSheetWidget(
                                    categories: categories,
                                    onTap: (CategoryModel category) {
                                      createAdsRequest.adsCategoryTxt.text = category.name!;
                                      createAdsRequest.categoryId = category.id!;
                                      Navigator.pop(context);
                                    },
                                  );

                                },
                              );
                            },
                            hintText: "دسته بندی آگهی را انتخاب کنید",
                            readOnly: true,
                          ),
                          SizedBox(height: 4.w),
                          // ads description
                          TextFieldWidget(
                            controller: createAdsRequest.adsDescriptionTxt,
                            validator: createAdsRequest.validateAdsDescription,
                            hintText: "توضیحات آگهی را وارد کنید",
                            maxLines: 3,
                          ),
                        ],
                      )),
                  SizedBox(height: 4.w),
                  // province and city
                  Row(
                    children: [
                      Expanded(
                          child: TextFieldWidget(
                              onTap: () {
                                showModalBottomSheet(context: context, builder: (context) {
                                  final currentState = (state.createAdsStatus as CreateAdsLoadDataSuccessStatus);
                                  return ProvinceAndCityBottomSheetWidget(
                                    provinceList: currentState.provinceResponse.provinces!,
                                    onCityTap: (ProvinceModel province, CityModel city) {
                                    createAdsRequest.adsProvinceTxt.text = province.name!;
                                    createAdsRequest.adsCityTxt.text = city.name!;
                                    createAdsRequest.cityId = city.id;
                                    Navigator.pop(context);
                                    },);
                                },);
                              },
                              controller: createAdsRequest.adsProvinceTxt,
                              hintText: "استان",
                              readOnly: true,
                              iconPath: Assets.svgs.arrowDown)),
                      SizedBox(width: 4.w),
                      Expanded(
                          child: TextFieldWidget(
                              onTap: () {
                                showModalBottomSheet(context: context, builder: (context) {
                                  final currentState = (state.createAdsStatus as CreateAdsLoadDataSuccessStatus);
                                  return ProvinceAndCityBottomSheetWidget(
                                    provinceList: currentState.provinceResponse.provinces!,
                                    onCityTap: (ProvinceModel province, CityModel city) {
                                      createAdsRequest.adsProvinceTxt.text = province.name!;
                                      createAdsRequest.adsCityTxt.text = city.name!;
                                      Navigator.pop(context);
                                    },);
                                },);
                              },
                              controller: createAdsRequest.adsCityTxt,
                              hintText: "شهر",
                              readOnly: true,
                              iconPath: Assets.svgs.arrowDown)),
                    ],
                  ),
                ],
              ) : const Center(child: CircularProgressIndicator(),),
            ),
          ),
        );
      },
    );
  }
}



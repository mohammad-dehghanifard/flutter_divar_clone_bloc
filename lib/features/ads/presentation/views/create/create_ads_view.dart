import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/create_ads_status.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/widgets/select_category_bottom_sheet_widget.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
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
    return BlocConsumer<AdsCubit, AdsState>(
      listener: (context, state) {
        if(state.createAdsStatus is CreateAdsErrorStatus) {
          Navigator.pop(context);
          final errorMessage = (state.createAdsStatus as CreateAdsErrorStatus).errorMessage;
          showCustomSnackBar(context: context, snackBar: showSnackBarWidget(message: errorMessage,mode: SnackBarMode.error));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const PageAppBarWidget(title: "ایجاد آگهی"),
          bottomNavigationBar: (state.createAdsStatus is CreateAdsLoadDataSuccessStatus)? Padding(
            padding: const EdgeInsets.all(Distances.bodyMargin),
            child: CustomButtonWidget(onTap: () {}, text: "ثبت آگهی"),
          ) : null,
          body: Padding(
            padding: const EdgeInsets.all(Distances.bodyMargin),
            child: SingleChildScrollView(
              child:  (state.createAdsStatus is CreateAdsLoadDataSuccessStatus)? Column(
                children: [
                  // ads image
                  GestureDetector(
                    onTap: () {

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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 32.w,
                              color: UiColors.greyColor),
                          Text("انتخاب عکس آگهی", style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w700))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.w),
                  // ads title
                  const TextFieldWidget(
                    hintText: "عنوان اگهی را وارد کنید",
                  ),
                  SizedBox(height: 4.w),
                  // ads category
                  TextFieldWidget(
                    onTap: () {
                      var categories = (state.createAdsStatus as CreateAdsLoadDataSuccessStatus).categories;
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SelectCategoryBottomSheetWidget(
                              categories: categories,
                              onTap: (CategoryModel category) {

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
                  const TextFieldWidget(
                    hintText: "توضیحات آگهی را وارد کنید",
                    maxLines: 3,
                  ),
                  SizedBox(height: 4.w),
                  // province and city
                  Row(
                    children: [
                      Expanded(
                          child: TextFieldWidget(
                              onTap: () {

                              },
                              hintText: "استان",
                              readOnly: true,
                              iconPath: Assets.svgs.arrowDown)),
                      SizedBox(width: 4.w),
                      Expanded(
                          child: TextFieldWidget(
                              onTap: () {

                              },
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



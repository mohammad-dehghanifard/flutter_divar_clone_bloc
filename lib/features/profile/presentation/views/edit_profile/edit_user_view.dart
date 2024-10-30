import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/province_and_city_bottom_sheet_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/widgets/select_image_bottom_sheet_widget.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditUserView extends StatelessWidget {
  static String routeName = "/editUser";

  const EditUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBarWidget(title: "ویرایش پروفایل"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Distances.bodyMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // image
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                    color: UiColors.whiteColor,
                    borderRadius: BorderRadius.circular(4.w)),
                child: Icon(Icons.image_outlined,
                    size: 16.w, color: UiColors.greyTextColor),
              ),
              // change text btn
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(context: context, builder: (context) {
                      return const SelectImageBottomSheetWidget();
                    },);
                  },
                  child: Text("تغییر عکس",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),)),
              SizedBox(height: 4.w),
              const TextFieldWidget(
                hintText: "نام و نام خانوادگی",
              ),
              SizedBox(height: 4.w),
              // province and city
              Row(
                children: [
                  Expanded(
                      child: TextFieldWidget(
                          onTap: () {},
                          hintText: "استان",
                          readOnly: true,
                          iconPath: Assets.svgs.arrowDown)),
                  SizedBox(width: 4.w),
                  Expanded(
                      child: TextFieldWidget(
                          onTap: () {},
                          hintText: "شهر",
                          readOnly: true,
                          iconPath: Assets.svgs.arrowDown)),
                ],
              ),
              SizedBox(height: 4.w),
              // address
              const TextFieldWidget(
                hintText: "آدرس",
                maxLines: 3,
              ),
              SizedBox(height: 8.w),
              // edit button
              CustomButtonWidget(onTap: () {}, text: "ویرایش")
            ],
          ),
        ),
      ),
    );
  }
}

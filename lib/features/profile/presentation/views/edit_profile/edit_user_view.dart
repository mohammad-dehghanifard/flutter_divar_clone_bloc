import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/user_model.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/custom_button_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/page_app_bar_widget.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/text_field_widget.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/load_image_network.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/pick_image.dart';
import 'package:flutter_divar_clone_bloc/features/profile/data/requests/edit_user_request.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/widgets/select_image_bottom_sheet_widget.dart';
import 'package:flutter_divar_clone_bloc/gen/assets.gen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditUserView extends StatefulWidget {
  const EditUserView({super.key, required this.user});
  final UserModel user;

  @override
  State<EditUserView> createState() => _EditUserViewState();
}

class _EditUserViewState extends State<EditUserView> {
  final EditUserRequest editUserRequest = EditUserRequest();

  @override
  void initState() {
    _initUserInformation();

    super.initState();
  }

  void _initUserInformation() {
    editUserRequest.fullNameTextController.text = widget.user.name!;
    editUserRequest.provinceTextController.text = widget.user.province!;
    editUserRequest.cityTextController.text = widget.user.city!;
    editUserRequest.cityId = widget.user.cityId!;
  }

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
                child: editUserRequest.image == null ? LoadNetworkImage(imageUrl: widget.user.avatar!) : Image.file(File(editUserRequest.image!.path)),
              ),
              // change text btn
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(context: context, builder: (context) {
                      return SelectImageBottomSheetWidget(
                        fromCameraTap: () async {
                          final image = await PickImage.imagePicker(ImageSource.camera);
                          if(image != null) {
                            editUserRequest.image = image;
                          }
                        },
                        fromGalleryTap: () async {
                          final image = await PickImage.imagePicker(ImageSource.gallery);
                          if(image != null) {
                            editUserRequest.image = image;
                          }
                        },
                      );
                    },);
                  },
                  child: Text("تغییر عکس",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),)),
              SizedBox(height: 4.w),
               TextFieldWidget(
                 controller: editUserRequest.fullNameTextController,
                validator: editUserRequest.validateFullName,
                hintText: "نام و نام خانوادگی",
              ),
              SizedBox(height: 4.w),
              // province and city
              Row(
                children: [
                  Expanded(
                      child: TextFieldWidget(
                          onTap: () {},
                          controller: editUserRequest.provinceTextController,
                          hintText: "استان",
                          readOnly: true,
                          iconPath: Assets.svgs.arrowDown)),
                  SizedBox(width: 4.w),
                  Expanded(
                      child: TextFieldWidget(
                          controller: editUserRequest.cityTextController,
                          onTap: () {},
                          hintText: "شهر",
                          readOnly: true,
                          iconPath: Assets.svgs.arrowDown)),
                ],
              ),
              SizedBox(height: 4.w),
              // address
              TextFieldWidget(
                controller: editUserRequest.addressTextController,
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

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class CreateAdsRequest {
  final TextEditingController adsTitleTxt = TextEditingController();
  final TextEditingController adsDescriptionTxt = TextEditingController();
  final TextEditingController adsPriceTxt = TextEditingController();
  int? categoryId,cityId;
  XFile? image;



  String? validateAdsTitle(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا یک عنوان برای آگهی خود را وارد کنید";
    }
    return null;
  }


  String? validateAdsDescription(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا توضیحات آگهی خود را وارد کنید";
    }
    return null;
  }


  String? validateAdsPrice(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا مبلغ را وارد کنید";
    }
    return null;
  }



  FormData sendRequest() {
    return FormData.fromMap(
      {
        "title" : adsTitleTxt.text,
        "description" : adsDescriptionTxt.text,
        "price" : adsPriceTxt.text,
        "category_id" : categoryId,
        "city_id" : cityId,
        if(image != null)
        "image" : MultipartFile.fromFileSync(image!.path)
      }
    );
  }
}
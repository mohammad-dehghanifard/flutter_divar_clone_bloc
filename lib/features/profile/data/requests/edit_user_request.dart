import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class EditUserRequest {
  final TextEditingController fullNameTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  int? cityId;
  String? imagePath;

  String? validateFullName(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا نام و نام خانوادگی خود را وارد کنید!";
    }
    return null;
  }

  String? validateAddress(String? value) {
    if(value!.isEmpty || value == "") {
      return "وارد کردن ادرس الزامی میباشد!";
    }
    return null;
  }

  FormData sendRequest() {
    return FormData.fromMap({
      "name" : fullNameTextController.text,
      "address" : addressTextController.text,
      "city_id" : cityId,
      if(imagePath != null)
      "avatar" : MultipartFile.fromFileSync(imagePath!)
    });
  }


}
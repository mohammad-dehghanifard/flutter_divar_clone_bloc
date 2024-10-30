import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class EditUserRequest {
  final TextEditingController fullNameTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController provinceTextController = TextEditingController();
  final TextEditingController cityTextController = TextEditingController();
  int? cityId;
  XFile? image;

  String? validateFullName(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا نام و نام خانوادگی خود را وارد کنید!";
    }
    return null;
  }



  FormData sendRequest() {
    return FormData.fromMap({
      "name" : fullNameTextController.text,
      if(addressTextController.text.isNotEmpty || addressTextController.text != "")
      "address" : addressTextController.text,
      "city_id" : cityId,
      if(image != null)
      "avatar" : MultipartFile.fromFileSync(image!.path)
    });
  }


}
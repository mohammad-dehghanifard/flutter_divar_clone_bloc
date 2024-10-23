import 'package:flutter/material.dart';

class LoginRequest {
  final TextEditingController mobileTextController = TextEditingController();
  final TextEditingController passWordTextController = TextEditingController();


  String? validateMobileNumber(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا یک شماره همراه وارد کنید!";
    } else if(value.length > 11) {
      return "شماره وارد شده معتبر نمیباشد!";
    }
    return null;
  }

  String? validatePassWord(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا یک رمز عبور وارد کنید";
    }
    return null;
  }


  Map<String,dynamic> sendRequest() {
    return {
      "mobile": mobileTextController.text,
      "password": passWordTextController.text,
    };
  }
}
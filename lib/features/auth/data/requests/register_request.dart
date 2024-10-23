import 'package:flutter/cupertino.dart';

class RegisterRequest {
  final TextEditingController userNameTextController = TextEditingController();
  final TextEditingController mobileTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController passWordTextController = TextEditingController();
  final TextEditingController confirmPassWordTextController = TextEditingController();
  int? cityId;

  // validators
  String? validateUserName(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا یک نام کاربری وارد کنید!";
    } else if(value.length <= 3) {
      return "نام کاربری شما بسیار کوتاه است!";
    }
    return null;
  }

  String? validateMobileNumber(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا یک شماره همراه وارد کنید!";
    } else if(value.length > 11) {
      return "شماره وارد شده معتبر نمیباشد!";
    }
    return null;
  }

  String? validateAddress(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا آدرس خود را وارد کنید!";
    }
    return null;
  }


  String? validatePassWord(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا یک رمز عبور وارد کنید";
    } else if(value.length <= 8) {
      return "رمز عبور شما بسیار کوتاه است!";
    }
    return null;
  }

  String? validateRepeatPassWord(String? value) {
    if(value!.isEmpty || value == "") {
      return "لطفا تکرار رمز عبور  خود را وارد کنید";
    } else if(value != passWordTextController.text) {
      return "رمز عبور و تکرار آن باهم مطابقت ندارند!";
    }
    return null;
  }

  Map<String,dynamic> sendRequest() {
    return {
      "name": userNameTextController.text,
      "mobile": mobileTextController.text,
      "address": addressTextController.text,
      "city_id": cityId,
      "password": passWordTextController.text,
      "password_confirmation": confirmPassWordTextController.text
    };
  }

}
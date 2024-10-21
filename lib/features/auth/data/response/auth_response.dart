import 'package:flutter_divar_clone_bloc/core/common/data/model/user_model.dart';

class LoginResponse {
  UserModel? user;
  String? token;

  LoginResponse({this.user, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }

}



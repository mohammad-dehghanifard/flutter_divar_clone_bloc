import 'package:flutter_divar_clone_bloc/core/common/data/model/user_model.dart';

class AuthResponse {
  UserModel? user;
  String? token;

  AuthResponse({this.user, this.token});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }

}



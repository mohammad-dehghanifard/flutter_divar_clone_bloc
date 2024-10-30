import 'package:dio/dio.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/endpoints.dart';
import 'package:flutter_divar_clone_bloc/core/utils/api/web_service.dart';
import 'package:flutter_divar_clone_bloc/features/profile/data/requests/edit_user_request.dart';

class ProfileApiProvider {
  final WebService _webService = WebService();


  Future<Response<dynamic>> provideUserInfoApi() async {
    final response = await _webService.getRequest(endPoint: EndPoints.getUserInfoEndPoints);
    return response;
  }

  Future<Response<dynamic>> provideEditUserApi({required EditUserRequest request}) async {
    final response = await _webService.postRequest(endPoint: EndPoints.editUserEndPoints,formData: request.sendRequest());
    return response;
  }

  Future<Response<dynamic>> provideProvinceApi() async {
    final response = await _webService.getRequest(endPoint: EndPoints.provinceEndPoints);
    return response;
  }
}
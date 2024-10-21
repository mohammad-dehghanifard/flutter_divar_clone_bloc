import 'package:dio/dio.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/endpoints.dart';
import 'package:flutter_divar_clone_bloc/core/utils/api/web_service.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/requests/register_request.dart';

class AuthApiProvider {

  final _webservice = WebService();

  Future<Response<dynamic>> provideRegisterApi({required RegisterRequest request}) async {
    final response = await _webservice.postRequest(endPoint: EndPoints.registerEndPoints,data: request.sendRequest());
    return response;
  }

}

import 'package:dio/dio.dart';
import 'package:flutter_divar_clone_bloc/core/utils/storages/shared_preferences_manager.dart';

class WebService {
  WebService._internal();
  static final WebService _singleton = WebService._internal();
  factory WebService() {
    return _singleton;
  }

  final dio = Dio(
    BaseOptions(
        baseUrl: "https://divar.hitaldev.ir/api",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "Accept" : "application/json",
          if(SharedPreferencesManager().getString(key: "token") != null)
            "Authorization" : "Bearer ${SharedPreferencesManager().getString(key: "token")}"
        },
        contentType: "application/json"
    ),
  );

  Future<Response<dynamic>> getRequest({required String endPoint,Map<String,dynamic>? params}) async => await dio.get(endPoint,queryParameters: params).timeout(const Duration(seconds: 10));

  Future<Response<dynamic>> postRequest({required String endPoint,Map<String,dynamic>? data,FormData? formData}) async => await dio.post(endPoint,data: data ?? formData).timeout(const Duration(seconds: 10));

}



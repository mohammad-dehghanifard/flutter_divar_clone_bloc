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


}



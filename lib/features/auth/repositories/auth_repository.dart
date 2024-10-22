import 'package:dio/dio.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/responses/perovince_response.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/data_source/remote/auth_api_provider.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/requests/register_request.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/response/auth_response.dart';

class AuthRepository {
  final AuthApiProvider _apiProvider = AuthApiProvider();

  Future<DataState<AuthResponse>> registerUserApiCall({required RegisterRequest request}) async {
    try {
      final Response response = await _apiProvider.provideRegisterApi(request: request);
      if(response.statusCode == 200) {
        return DataSuccess(AuthResponse.fromJson(response.data));
      } else {
        return DataFailed(response.data["message"]);
      }
    }catch(e) {
      return const DataFailed("خطای ناشناخته ای رخ داده!");
    }
  }

  Future<DataState<ProvinceResponse>> fetchProvinceApiCall() async {
    try {
      final Response response = await _apiProvider.provideProvinceApi();
      if(response.statusCode == 200) {
        return DataSuccess(ProvinceResponse.fromJson(response.data));
      } else {
        return DataFailed(response.statusMessage ?? "خطایی در دریافت اطلاعات رخ داده است!");
      }
    } catch(e) {
      return const DataFailed("خطای ناشناخته ای رخ داده!");
    }
  }

}
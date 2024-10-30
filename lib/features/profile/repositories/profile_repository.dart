import 'package:flutter_divar_clone_bloc/core/common/data/model/user_model.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/profile/data/data_source/remote/profile_api_provider.dart';
import 'package:flutter_divar_clone_bloc/features/profile/data/requests/edit_user_request.dart';

class ProfileRepository {
  final ProfileApiProvider _apiProvider = ProfileApiProvider();

  Future<DataState<UserModel>> getUserInfoApiCall() async {
    try {
      final response = await _apiProvider.provideUserInfoApi();
      if(response.statusCode == 200) {
        return DataSuccess(UserModel.fromJson(response.data['data']));
      } else {
        return DataFailed(response.data['message']);
      }
    } catch(e) {
      return const DataFailed("خطای ناشناخته ای رخ داده لطفا با پشتیبانی تماس بگیرید");
    }
  }

  Future<DataState<bool>> editUserApiCall({required EditUserRequest request}) async {
    try {
      final response = await _apiProvider.provideEditUserApi(request: request);
      if(response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.data['message']);
      }

    } catch(e) {
      return const DataFailed("خطای ناشناخته ای رخ داده لطفا با پشتیبانی تماس بگیرید!");
    }
  }
}
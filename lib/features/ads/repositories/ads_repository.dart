import 'package:dio/dio.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/responses/province_response.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/data_source/remote/ads_api_provider.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/detail_ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/params/ads_params.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/requests/create_ads_request.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';

class AdsRepository {
  final AdsApiProvider _apiProvider = AdsApiProvider();

  Future<DataState<List<AdsModel>>> getAndFilterAdsApiCall({AdsParams? params}) async {
    try {
      final response = await _apiProvider.provideGetAndFilterAdsApi(params: params);
      if(response.statusCode == 200) {
        final List<AdsModel> adsList = [];
        for(var item in response.data["data"]) {
          adsList.add(AdsModel.fromJson(item));
        }
        return DataSuccess(adsList);
      } else {
        return DataFailed(response.data["message"]);
      }
    } catch(e) {
      return const DataFailed("خطای ناشناخته ای رخ داده با پشتیبانی تماس بگیرید!");
    }
  }

  Future<DataState<DetailAdsModel>> getAdsDetailApiCall({required int adsId}) async {
    try {
      final response = await _apiProvider.provideDetailAdsApi(adsId: adsId);
      if(response.statusCode == 200) {
        return DataSuccess(DetailAdsModel.fromJson(response.data["data"]));
      } else {
        return DataFailed(response.data["message"]);
      }
    } catch(e) {
      return const DataFailed("خطای ناشناخته ای رخ داده با پشتیبانی تماس بگیرید!");
    }
  }

  Future<DataState<List<CategoryModel>>> getAllCategoriesApiCall() async {
    try {
      final response = await _apiProvider.provideGetAllCategoryApi();
      if(response.statusCode == 200) {
        final List<CategoryModel> categories = [];
        for(Map<String,dynamic> category in response.data["data"]) {
          categories.add(CategoryModel.fromJson(category));
        }
        return DataSuccess(categories);
      } else {
        return DataFailed(response.data["message"]);
      }
    } catch(e) {
      return const DataFailed("خطای ناشناخته ای رخ داده لطفا با پشتیبانی تماس بگیرید!");
    }
  }

  Future<DataState<ProvinceResponse>> getAllProvincesApiCall() async {
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

  Future<DataState<bool>> createNewAdsApiCall({required CreateAdsRequest request}) async {
    try {
      final response = await _apiProvider.provideCreateAdsApi(request: request);
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
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/data_source/remote/ads_api_provider.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/detail_ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/params/ads_params.dart';

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

}
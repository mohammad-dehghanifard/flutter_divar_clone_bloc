import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/data_source/remote/ads_api_provider.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';

class AdsRepository {
  final AdsApiProvider _apiProvider = AdsApiProvider();

  Future<DataState<List<AdsModel>>> getAndFilterAdsApiCall() async {
    try {
      final response = await _apiProvider.provideGetAndFilterAdsApi();
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
}
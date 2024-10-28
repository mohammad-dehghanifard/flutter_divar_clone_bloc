import 'package:dio/dio.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/endpoints.dart';
import 'package:flutter_divar_clone_bloc/core/utils/api/web_service.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/params/ads_params.dart';

class AdsApiProvider {
  final WebService _webService = WebService();

  Future<Response<dynamic>> provideGetAndFilterAdsApi({AdsParams? params}) async {
    final response = await _webService.getRequest(
        endPoint: EndPoints.getAndFilterAdsEndPoints,
        params: {
          "city_id" : params?.cityId,
          "province_id" : params?.provinceId,
          "category_id" : params?.categoryId,
          "order_by" : params?.orderBy,
          "order_type" : params?.orderType,
          "keyword" : params?.searchKeyWord,
        }
    );
    return response;
  }

  Future<Response<dynamic>> provideDetailAdsApi({required int adsId}) async {
    final response = await _webService.getRequest(endPoint: "${EndPoints.getDetailAdsEndPoints}/$adsId");
    return response;
  }

}
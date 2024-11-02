import 'package:dio/dio.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/endpoints.dart';
import 'package:flutter_divar_clone_bloc/core/utils/api/web_service.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/params/ads_params.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/requests/create_ads_request.dart';

class AdsApiProvider {
  final WebService _webService = WebService();

  Future<Response<dynamic>> provideGetAndFilterAdsApi({AdsParams? params}) async {
    final response = await _webService.getRequest(
        endPoint: EndPoints.getAndFilterAdsEndPoints,
        params: {
          if(params?.cityId != null)
          "city_id" : params?.cityId,
          if(params?.provinceId != null)
          "province_id" : params?.provinceId,
          if(params?.categoryId != null)
          "category_id" : params?.categoryId,
          if(params?.orderBy != null)
          "order_by" : params?.orderBy,
          if(params?.orderType != null)
          "order_type" : params?.orderType,
          if(params?.searchKeyWord != null)
          "keyword" : params?.searchKeyWord,
        }
    );
    return response;
  }

  Future<Response<dynamic>> provideDetailAdsApi({required int adsId}) async {
    final response = await _webService.getRequest(endPoint: "${EndPoints.getDetailAdsEndPoints}/$adsId");
    return response;
  }

  Future<Response<dynamic>> provideProvinceApi() async {
    final response = await _webService.getRequest(endPoint: EndPoints.provinceEndPoints);
    return response;
  }

  Future<Response<dynamic>> provideGetAllCategoryApi() async {
    final response = await _webService.getRequest(endPoint: EndPoints.getAllCategoriesEndPoints);
    return response;
  }
  
  Future<Response<dynamic>> provideCreateAdsApi({required CreateAdsRequest request}) async {
    final response = await _webService.postRequest(endPoint: EndPoints.createAdsEndPoints,formData: request.sendRequest());
    return response;
  }

}
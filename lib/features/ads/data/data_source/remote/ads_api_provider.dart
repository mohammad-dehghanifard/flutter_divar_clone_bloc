import 'package:dio/dio.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/endpoints.dart';
import 'package:flutter_divar_clone_bloc/core/utils/api/web_service.dart';

class AdsApiProvider {
  final WebService _webService = WebService();

  Future<Response<dynamic>> provideGetAndFilterAdsApi() async {
    final response = await _webService.getRequest(endPoint: EndPoints.getAndFilterAdsEndPoints);
    return response;
  }

  Future<Response<dynamic>> provideDetailAdsApi({required int adsId}) async {
    final response = await _webService.getRequest(endPoint: "${EndPoints.getDetailAdsEndPoints}/$adsId");
    return response;
  }

}
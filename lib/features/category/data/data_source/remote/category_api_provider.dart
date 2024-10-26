import 'package:dio/dio.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/endpoints.dart';
import 'package:flutter_divar_clone_bloc/core/utils/api/web_service.dart';

class CategoryApiProvider {
  final WebService _webService = WebService();
  
  
  Future<Response<dynamic>> provideGetAllCategoryApi() async {
    final response = await _webService.getRequest(endPoint: EndPoints.getAllCategoriesEndPoints);
    return response;
  }
}
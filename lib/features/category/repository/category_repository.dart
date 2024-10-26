import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/data_source/remote/category_api_provider.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';

class CategoryRepository {
  final CategoryApiProvider _apiProvider = CategoryApiProvider();

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
}
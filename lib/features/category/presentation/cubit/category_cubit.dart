import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';
import 'package:flutter_divar_clone_bloc/features/category/presentation/cubit/category_status.dart';
import 'package:flutter_divar_clone_bloc/features/category/repository/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState(categoryStatus: CategoryInitialStatus()));

  final CategoryRepository _categoryRepository = CategoryRepository();

  Future<void> fetchCategoryData() async {
    emit(state.copyWith(newStatus: CategoryLoadDataStatus()));
    final DataState<List<CategoryModel>> result = await _categoryRepository.getAllCategoriesApiCall();

    if(result is DataSuccess) {
      emit(state.copyWith(newStatus: CategoryLoadDataSuccessStatus(categories: result.data!)));
    }

    if(result is DataFailed) {
      emit(state.copyWith(newStatus: CategoryLoadDataErrorStatus(errorMessage: result.error ?? "خطای ناشناخته ای رخ داده، لطفا با پشتیبانی تماس بگرید.")));
    }
  }
}

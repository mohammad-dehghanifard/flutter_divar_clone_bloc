
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';

sealed class CategoryStatus {}

final class CategoryInitialStatus extends CategoryStatus {}
final class CategoryLoadDataStatus extends CategoryStatus {}
final class CategoryLoadDataSuccessStatus extends CategoryStatus {
  CategoryLoadDataSuccessStatus({required this.categories});
  final List<CategoryModel> categories;
}
final class CategoryLoadDataErrorStatus extends CategoryStatus {
  final String errorMessage;
  CategoryLoadDataErrorStatus({required this.errorMessage});
}


part of 'category_cubit.dart';

class CategoryState {
  CategoryState({required this.categoryStatus});
  CategoryStatus categoryStatus;

  CategoryState copyWith({CategoryStatus? newStatus}) {
    return CategoryState(categoryStatus: newStatus ?? categoryStatus);
  }
}
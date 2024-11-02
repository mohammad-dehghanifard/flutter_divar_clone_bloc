import 'package:flutter_divar_clone_bloc/core/common/data/responses/province_response.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';
import 'package:image_picker/image_picker.dart';

sealed class CreateAdsStatus {}

final class CreateAdsInitial extends CreateAdsStatus {}

final class CreateAdsLoadingPageStatus extends CreateAdsStatus {}

final class CreateAdsLoadDataSuccessStatus extends CreateAdsStatus {
  CreateAdsLoadDataSuccessStatus(
      {required this.provinces, required this.categories, this.image});

  final ProvinceResponse provinces;
  final List<CategoryModel> categories;
  XFile? image;
}

final class CreateAdsErrorStatus extends CreateAdsStatus {
  CreateAdsErrorStatus({required this.errorMessage});
  final String errorMessage;
}


final class CreateAdsSuccessStatus extends CreateAdsStatus {}
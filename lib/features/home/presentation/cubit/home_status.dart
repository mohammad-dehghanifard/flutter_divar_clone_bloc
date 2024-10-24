
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';

sealed class HomeStatus {}

final class HomeInitial extends HomeStatus {}

final class HomeLoadDataStatus extends HomeStatus {}

final class HomeLoadDataSuccessStatus extends HomeStatus {
  HomeLoadDataSuccessStatus({required this.adsList});
  final List<AdsModel> adsList;
}

final class HomeLoadDataErrorStatus extends HomeStatus {
  HomeLoadDataErrorStatus({required this.errorMessage});
  final String errorMessage;
}

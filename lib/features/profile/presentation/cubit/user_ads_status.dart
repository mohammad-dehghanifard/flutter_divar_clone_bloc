
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';

sealed class UserAdsStatus{}

final class UserAdsLoadingStatus extends UserAdsStatus {}

final class UserAdsLoadDataSuccessStatus extends UserAdsStatus {
  UserAdsLoadDataSuccessStatus({required this.adsList});
  final List<AdsModel> adsList;
}

final class UserAdsErrorStatus extends UserAdsStatus {
  final String errorMessage;
  UserAdsErrorStatus({required this.errorMessage});
}
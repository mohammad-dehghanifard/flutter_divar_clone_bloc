
import 'package:flutter_divar_clone_bloc/features/ads/data/models/detail_ads_model.dart';

sealed class DetailAdsStatus {}

final class DetailAdsInitial extends DetailAdsStatus {}

final class DetailAdsLoadData extends DetailAdsStatus {}

final class DetailAdsLoadDataSuccess extends DetailAdsStatus {
  DetailAdsLoadDataSuccess({required this.ads});
  final DetailAdsModel ads;
}

final class DetailAdsLoadDataError extends DetailAdsStatus {
  DetailAdsLoadDataError({required this.errorMessage});
  final String errorMessage;
}

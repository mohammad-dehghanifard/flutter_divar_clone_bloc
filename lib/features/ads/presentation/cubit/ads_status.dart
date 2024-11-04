import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';

sealed class AdsStatus {}

final class AdsInitial extends AdsStatus {}

final class AdsLoading extends AdsStatus {}

final class AdsLoadDataCompleted extends AdsStatus {
  AdsLoadDataCompleted({required this.adsList});
  final List<AdsModel> adsList;
}

final class AdsError extends AdsStatus {
  AdsError({required this.errorMessage});
  final String errorMessage;

}

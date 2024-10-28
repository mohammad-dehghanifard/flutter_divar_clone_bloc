import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';

sealed class AdsSearchStatus {}

final class AdsSearchInitial extends AdsSearchStatus {}

final class AdsSearchLoading extends AdsSearchStatus {}

final class AdsSearchLoadDataCompleted extends AdsSearchStatus {
  AdsSearchLoadDataCompleted({required this.adsList});
  final List<AdsModel> adsList;
}

final class AdsSearchError extends AdsSearchStatus {
  AdsSearchError({required this.errorMessage});
  final String errorMessage;

}

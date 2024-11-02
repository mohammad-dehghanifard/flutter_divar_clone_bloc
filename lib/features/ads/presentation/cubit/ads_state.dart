part of 'ads_cubit.dart';


class AdsState {
  AdsState({required this.searchStatus,required this.createAdsStatus});
  AdsSearchStatus searchStatus;
  CreateAdsStatus createAdsStatus;

  AdsState copyWith({AdsSearchStatus ? newSearchStatus,CreateAdsStatus? newCreateAdsStatus}) {
    return AdsState(searchStatus: newSearchStatus ?? searchStatus, createAdsStatus: newCreateAdsStatus ?? createAdsStatus);
  }
}
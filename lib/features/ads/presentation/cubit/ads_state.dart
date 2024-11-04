part of 'ads_cubit.dart';


class AdsState {
  AdsState({required this.adsStatus,required this.createAdsStatus});
  AdsStatus adsStatus;
  CreateAdsStatus createAdsStatus;

  AdsState copyWith({AdsStatus ? newSearchStatus,CreateAdsStatus? newCreateAdsStatus}) {
    return AdsState(adsStatus: newSearchStatus ?? adsStatus, createAdsStatus: newCreateAdsStatus ?? createAdsStatus);
  }
}
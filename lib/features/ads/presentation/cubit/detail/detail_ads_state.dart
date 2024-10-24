part of 'detail_ads_cubit.dart';


class DetailAdsState {
  DetailAdsState({required this.detailAdsStatus});
  DetailAdsStatus detailAdsStatus;

  DetailAdsState copyWith({DetailAdsStatus? newStatus}) {
    return DetailAdsState(detailAdsStatus: newStatus ?? detailAdsStatus);
  }
}
part of 'ads_cubit.dart';


class AdsState {
  AdsState({required this.searchStatus});
  AdsSearchStatus searchStatus;

  AdsState copyWith({AdsSearchStatus ? newSearchStatus}) {
    return AdsState(searchStatus: newSearchStatus ?? searchStatus);
  }
}
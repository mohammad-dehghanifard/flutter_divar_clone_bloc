import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/detail_ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/detail/detail_ads_status.dart';
import 'package:flutter_divar_clone_bloc/features/ads/repositories/ads_repository.dart';

part 'detail_ads_state.dart';

class DetailAdsCubit extends Cubit<DetailAdsState> {
  DetailAdsCubit() : super(DetailAdsState(detailAdsStatus: DetailAdsInitial()));
  final AdsRepository _adsRepository = AdsRepository();


  Future<void> fetchDetailAdsData({required int adsId}) async {
    emit(state.copyWith(newStatus: DetailAdsLoadData()));
    final DataState<DetailAdsModel> result = await _adsRepository.getAdsDetailApiCall(adsId: adsId);

    if(result is DataSuccess) {
      emit(state.copyWith(newStatus: DetailAdsLoadDataSuccess(ads: result.data!)));
    }

    if(result is DataFailed) {
      emit(state.copyWith(newStatus: DetailAdsLoadDataError(errorMessage: result.error ?? "خطای ناشناخته ای رخ داده، لطفا با پشتیبانی تماس بگیرید")));
    }
  }


}

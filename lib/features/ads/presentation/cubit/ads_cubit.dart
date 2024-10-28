import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/params/ads_params.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_search_status.dart';
import 'package:flutter_divar_clone_bloc/features/ads/repositories/ads_repository.dart';


part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit() : super(AdsState(searchStatus: AdsSearchInitial()));

  final AdsRepository _adsRepository = AdsRepository();

  Future<void> getAdsByKeyWord({required AdsParams params}) async {
    emit(state.copyWith(newSearchStatus: AdsSearchLoading()));
    final DataState<List<AdsModel>> result = await _adsRepository.getAndFilterAdsApiCall(params: params);
    
    if(result is DataSuccess) {
      emit(state.copyWith(newSearchStatus: AdsSearchLoadDataCompleted(adsList: result.data!)));
    }
    
    if(result is DataFailed) {
      emit(state.copyWith(newSearchStatus: AdsSearchError(errorMessage: result.error ?? "خظای ناشناخته ای رخ داده،لطفا با پشتیبانی تماس بگیرید!")));
    }
  }
}

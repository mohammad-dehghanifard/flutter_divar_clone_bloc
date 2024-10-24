import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/repositories/ads_repository.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/cubit/home_status.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(homeStatus: HomeInitial()));

  final AdsRepository _adsRepository = AdsRepository();

  Future<void> fetchHomeData() async {
    emit(state.copyWith(newStatus: HomeLoadDataStatus()));
    final DataState<List<AdsModel>> result = await _adsRepository.getAndFilterAdsApiCall();

    if(result is DataSuccess) {
      emit(state.copyWith(newStatus: HomeLoadDataSuccessStatus(adsList: result.data!)));
    } else {
      emit(state.copyWith(newStatus: HomeLoadDataErrorStatus(errorMessage: result.error ?? "خطای ناشناخته با پشتیبانی تماس بگیرید!")));
    }
  }

}

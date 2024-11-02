import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/responses/province_response.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/pick_image.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/params/ads_params.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/ads_search_status.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/cubit/create_ads_status.dart';
import 'package:flutter_divar_clone_bloc/features/ads/repositories/ads_repository.dart';
import 'package:flutter_divar_clone_bloc/features/category/data/models/category_model.dart';
import 'package:image_picker/image_picker.dart';


part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit() : super(AdsState(
      searchStatus: AdsSearchInitial(),
    createAdsStatus: CreateAdsInitial()
  ));

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

  Future<void> getCategoriesAndProvinces() async {
    emit(state.copyWith(newCreateAdsStatus: CreateAdsLoadingPageStatus()));
    final DataState<ProvinceResponse> provincesState = await _adsRepository.getAllProvincesApiCall();
    final DataState<List<CategoryModel>> categoriesState = await _adsRepository.getAllCategoriesApiCall();

    if(provincesState is DataSuccess && categoriesState is DataSuccess) {
      emit(state.copyWith(newCreateAdsStatus: CreateAdsLoadDataSuccessStatus(
          provinceResponse: provincesState.data!,
          categories: categoriesState.data!
      )));
    }

    if(provincesState is DataFailed || categoriesState is DataFailed) {
      emit(state.copyWith(newCreateAdsStatus: CreateAdsErrorStatus(
          errorMessage: provincesState.error ?? categoriesState.error ?? "خطای ناشناخته ای رخ داده با پشتیبانی تماس بگیرید"
      )));
    }
  }

  Future<XFile?> changeImage({required ImageSource source}) async {
    final image = await PickImage.imagePicker(source);
    if(state.createAdsStatus is CreateAdsLoadDataSuccessStatus) {
      if(image != null ) {
        final provinceResponse = (state.createAdsStatus as CreateAdsLoadDataSuccessStatus).provinceResponse;
        final categories = (state.createAdsStatus as CreateAdsLoadDataSuccessStatus).categories;
        emit(state.copyWith(newCreateAdsStatus: CreateAdsLoadDataSuccessStatus(
            provinceResponse: provinceResponse,
            categories: categories,
            image: image)));
        return image;
      }
    }
    return null;
  }
}

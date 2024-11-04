import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/user_model.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/responses/province_response.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/core/utils/image/pick_image.dart';
import 'package:flutter_divar_clone_bloc/features/ads/data/models/ads_model.dart';
import 'package:flutter_divar_clone_bloc/features/profile/data/requests/edit_user_request.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/edit_profile_status.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/profile_status.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/user_ads_status.dart';
import 'package:flutter_divar_clone_bloc/features/profile/repositories/profile_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(
      ProfileState(
          profileStatus: ProfileInitial(),
          editProfileStatus: ProfileInitialStatus(),
          userAdsStatus: UserAdsInitialStatus()
      ));

  final ProfileRepository _profileRepository = ProfileRepository();

  Future<void> fetchUserData() async {
    emit(state.copyWith(newProfileStatus: ProfileDataLoading()));
    final DataState<UserModel> result = await _profileRepository.getUserInfoApiCall();

    if(result is DataSuccess) {
      emit(state.copyWith(newProfileStatus: ProfileLoadDataSuccess(user: result.data!)));
    }

    if(result is DataFailed) {
      emit(state.copyWith(newProfileStatus: ProfileLoadDataError(errorMessage: result.error ?? "خطای ناشناخته ای رخ داده با پشتیبانی تماس بگیرید!")));
    }
  }

  Future<void> fetchProvinces() async {
    emit(state.copyWith(newEditProfileStatus: EditProfileLoadingStatus()));
    final DataState<ProvinceResponse> result = await _profileRepository.fetchProvinceApiCall();

    if(result is DataSuccess) {
      emit(state.copyWith(newEditProfileStatus: EditProfileLoadDataSuccessStatus(provinces: result.data!.provinces!)));
    }

    if(result is DataFailed) {
      emit(state.copyWith(newEditProfileStatus: EditProfileLoadDataErrorStatus(errorMessage: result.error ?? "خطای ناشاناخته ای رخ داده با پشتیبانی تماس بگیرید.")));
    }
  }

  Future<XFile?> changeImage({required ImageSource source}) async {
    final image = await PickImage.imagePicker(source);
    if(state.editProfileStatus is EditProfileLoadDataSuccessStatus) {
      if(image != null ) {
        final provinces = (state.editProfileStatus as EditProfileLoadDataSuccessStatus).provinces;
        emit(state.copyWith(newEditProfileStatus: EditProfileLoadDataSuccessStatus(provinces: provinces,image: image)));
        return image;
      }
    }
    return null;
  }

  Future<void> editUser({required EditUserRequest request}) async {
    final DataState<bool> result = await _profileRepository.editUserApiCall(request: request);
    if(result is DataSuccess) {
      emit(state.copyWith(newEditProfileStatus: EditProfileChangeInformationSuccessStatus(message: "اطلاعات حساب کاربری شما با موفقیت ویرایش شد")));
    }
    if(result is DataFailed) {
      emit(state.copyWith(newEditProfileStatus: EditProfileLoadDataErrorStatus(errorMessage: result.error ?? "خطای ناشناخته ای رخ داده لطفا با پشتیبانی تماس بگیرید")));
    }
  }

  Future<void> getAllUserAds() async {
    emit(state.copyWith(newUserAdsStatus: UserAdsLoadingStatus()));
    final DataState<List<AdsModel>> result = await _profileRepository.getAllUserAdsApiCall();

    if(result is DataSuccess) {
      emit(state.copyWith(newUserAdsStatus: UserAdsLoadDataSuccessStatus(adsList: result.data!)));
    }

    if(result is DataFailed) {
      emit(state.copyWith(newUserAdsStatus: UserAdsErrorStatus(errorMessage: result.error ?? "خطای ناشناخته ای رخ داده لطفا با پشتیبانی تماس بگیرید")));
    }
  }
}

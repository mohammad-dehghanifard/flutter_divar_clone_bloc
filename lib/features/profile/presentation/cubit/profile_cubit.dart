import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/user_model.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/responses/province_response.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/edit_profile_status.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/profile_status.dart';
import 'package:flutter_divar_clone_bloc/features/profile/repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(
      ProfileState(
          profileStatus: ProfileInitial(),
          editProfileStatus: ProfileInitialStatus()
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


}

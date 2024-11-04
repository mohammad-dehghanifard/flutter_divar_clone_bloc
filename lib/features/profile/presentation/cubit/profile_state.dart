part of 'profile_cubit.dart';

class ProfileState {
  ProfileState({required this.profileStatus,required this.editProfileStatus,required this.userAdsStatus});
  ProfileStatus profileStatus;
  EditProfileStatus editProfileStatus;
  UserAdsStatus userAdsStatus;

  ProfileState copyWith({ProfileStatus? newProfileStatus,EditProfileStatus? newEditProfileStatus,UserAdsStatus? newUserAdsStatus}) {
    return ProfileState(
        profileStatus: newProfileStatus ?? profileStatus,
        editProfileStatus: newEditProfileStatus ?? editProfileStatus,
        userAdsStatus: newUserAdsStatus ?? userAdsStatus
    );
  }
}
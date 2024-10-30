part of 'profile_cubit.dart';

class ProfileState {
  ProfileState({required this.profileStatus,required this.editProfileStatus});
  ProfileStatus profileStatus;
  EditProfileStatus editProfileStatus;

  ProfileState copyWith({ProfileStatus? newProfileStatus,EditProfileStatus? newEditProfileStatus}) {
    return ProfileState(
        profileStatus: newProfileStatus ?? profileStatus,
        editProfileStatus: newEditProfileStatus ?? editProfileStatus
    );
  }
}
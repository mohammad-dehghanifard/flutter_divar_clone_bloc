part of 'profile_cubit.dart';

class ProfileState {
  ProfileState({required this.profileStatus});
  ProfileStatus profileStatus;

  ProfileState copyWith({ProfileStatus? newProfileStatus}) {
    return ProfileState(profileStatus: newProfileStatus ?? profileStatus);
  }
}
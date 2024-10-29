

import 'package:flutter_divar_clone_bloc/core/common/data/model/user_model.dart';

sealed class ProfileStatus {}

final class ProfileInitial extends ProfileStatus {}

final class ProfileDataLoading extends ProfileStatus {}

final class ProfileLoadDataSuccess extends ProfileStatus {
  ProfileLoadDataSuccess({required this.user});
  final UserModel user;
}

final class ProfileLoadDataError extends ProfileStatus {
  ProfileLoadDataError({required this.errorMessage});
  final String errorMessage;
}
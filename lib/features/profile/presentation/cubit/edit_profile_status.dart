import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';
import 'package:image_picker/image_picker.dart';

sealed class EditProfileStatus {}

final class ProfileInitialStatus extends EditProfileStatus {}

final class EditProfileLoadingStatus extends EditProfileStatus {}

final class EditProfileLoadDataSuccessStatus extends EditProfileStatus {
  EditProfileLoadDataSuccessStatus({required this.provinces,this.image});
  final List<ProvinceModel> provinces;
  final XFile? image;
}

final class EditProfileChangeInformationSuccessStatus extends EditProfileStatus {
  EditProfileChangeInformationSuccessStatus({required this.message});
  final String message;
}

final class EditProfileLoadDataErrorStatus extends EditProfileStatus {
  EditProfileLoadDataErrorStatus({required this.errorMessage});
  final String errorMessage;
}

import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';
import 'package:image_picker/image_picker.dart';

sealed class EditProfileStatus {}

final class ProfileInitialStatus extends EditProfileStatus {}

final class EditProfileLoadingStatus extends EditProfileStatus {}

final class EditProfileLoadDataSuccessStatus extends EditProfileStatus {
  EditProfileLoadDataSuccessStatus({required this.provinces});
  final List<ProvinceModel> provinces;
}

final class EditProfileChangeImageStatus extends EditProfileStatus {
  EditProfileChangeImageStatus({required this.image});
  final XFile image;
}

final class EditProfileChangeInformationStatus extends EditProfileStatus {}


final class EditProfileLoadDataErrorStatus extends EditProfileStatus {
  EditProfileLoadDataErrorStatus({required this.errorMessage});
  final String errorMessage;
}

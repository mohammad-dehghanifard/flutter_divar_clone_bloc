
import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';

sealed class RegisterStatus {}

final class RegisterInitial extends RegisterStatus {}

final class RegisterLoadingStatus extends RegisterStatus {}

final class RegisterSuccessStatus extends RegisterStatus {}

final class RegisterLoadingPageStatus extends RegisterStatus {}

final class RegisterPageLoadingCompletedStatus extends RegisterStatus {
  RegisterPageLoadingCompletedStatus({required this.provinces});
  final List<ProvinceModel> provinces;
}

final class RegisterPageLoadingErrorStatus extends RegisterStatus {}


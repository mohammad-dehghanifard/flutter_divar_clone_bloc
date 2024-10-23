
import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';

sealed class RegisterStatus {}

final class RegisterInitial extends RegisterStatus {}

final class RegisterLoadingStatus extends RegisterStatus {}

final class RegisterSuccessStatus extends RegisterStatus {}

final class RegisterLoadingPageStatus extends RegisterStatus {}

final class RegisterPageLoadingCompletedStatus extends RegisterStatus {
  RegisterPageLoadingCompletedStatus( {required this.provinces,this.province, this.city});
  final List<ProvinceModel> provinces;
  final String? province;
  final CityModel? city;
}

final class RegisterPageLoadingErrorStatus extends RegisterStatus {}

final class RegisterErrorStatus extends RegisterStatus {
  final String? message;
  RegisterErrorStatus({this.message});
}

final class RegisterCompletedStatus extends RegisterStatus {}

final class RegisterLoadingButtonStatus extends RegisterStatus {
  RegisterLoadingButtonStatus({required this.isLoading});
  final bool isLoading;
}


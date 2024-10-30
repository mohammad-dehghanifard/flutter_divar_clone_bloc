import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/responses/province_response.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/core/utils/storages/shared_preferences_manager.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/requests/register_request.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/response/auth_response.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/cubit/register/register_status.dart';
import 'package:flutter_divar_clone_bloc/features/auth/repositories/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState(registerStatus: RegisterInitial()));

  final AuthRepository _authRepository = AuthRepository();

  Future<void> fetchProvinces() async {
    emit(state.copyWith(newStatus: RegisterLoadingPageStatus()));
    final DataState<ProvinceResponse> result = await _authRepository.fetchProvinceApiCall();

    if(result is DataSuccess) {
      emit(state.copyWith(newStatus: RegisterPageLoadingCompletedStatus(provinces: result.data!.provinces!)));
    }

    if(result is DataFailed) {
      emit(state.copyWith(newStatus: RegisterPageLoadingErrorStatus()));
    }
  }

  Future<void> register({required RegisterRequest request}) async {
    emit(state.copyWith(newStatus: RegisterLoadingButtonStatus(isLoading: true)));
    final DataState<AuthResponse> result = await _authRepository.registerUserApiCall(request: request);

    if(result is DataSuccess) {
      final prefs = SharedPreferencesManager();
      // saveToken
      await prefs.saveString(key: "token", value: result.data!.token!);
      emit(state.copyWith(newStatus: RegisterCompletedStatus()));
    }

    if(result is DataFailed) {
      emit(state.copyWith(newStatus: RegisterLoadingButtonStatus(isLoading: false)));
      emit(state.copyWith(newStatus: RegisterErrorStatus(message: result.error)));
    }
  }

  void changeProvince({required ProvinceModel province,required CityModel city}) {
    if(state.registerStatus is RegisterPageLoadingCompletedStatus){
      final provinces = (state.registerStatus as RegisterPageLoadingCompletedStatus).provinces;
      emit(state.copyWith(newStatus: RegisterPageLoadingCompletedStatus(province: province.name!,city: city,provinces: provinces)));
    }

  }


}

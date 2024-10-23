import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/resources/data_state.dart';
import 'package:flutter_divar_clone_bloc/core/utils/storages/shared_preferences_manager.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/requests/login_request.dart';
import 'package:flutter_divar_clone_bloc/features/auth/data/response/auth_response.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/cubit/login/login_status.dart';
import 'package:flutter_divar_clone_bloc/features/auth/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState(loginStatus: LoginInitial()));
  final AuthRepository _authRepository = AuthRepository();

  Future<void> login({required LoginRequest request}) async {
    emit(state.copyWith(newStatus: LoginLoadingButton(isLoading: true)));
    final DataState<AuthResponse> result = await _authRepository.loginUserApiCall(request: request);

    if(result is DataSuccess) {
      final prefs = SharedPreferencesManager().preferences;
      if(result.data!.token != null) {
       await prefs?.setString("token", result.data!.token!);
       emit(state.copyWith(newStatus: LoginSuccess()));
      }
    }

    if(result is DataFailed) {
      emit(state.copyWith(newStatus: LoginError(errorMessage: result.error ?? "خطای ناشناخته با پشتیبانی تماس بگیرید!")));
    }

  }
}

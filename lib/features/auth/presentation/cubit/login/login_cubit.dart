import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/cubit/login/login_status.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState(loginStatus: LoginInitial()));
}

part of 'login_cubit.dart';


class LoginState {
  LoginState({required this.loginStatus});
  LoginStatus loginStatus;

  LoginState copyWith({required LoginStatus? newStatus}) {
    return LoginState(loginStatus: newStatus ?? loginStatus);
  }
}
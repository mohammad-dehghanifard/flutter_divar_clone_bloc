part of 'register_cubit.dart';



class RegisterState {
  RegisterState({required this.registerStatus});
  RegisterStatus registerStatus;

  RegisterState copyWith({required RegisterStatus? newStatus}) {
    return RegisterState(registerStatus: newStatus ?? registerStatus);
  }

}
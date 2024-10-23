
sealed class LoginStatus {}

final class LoginInitial extends LoginStatus {}

final class LoginLoadingButton extends LoginStatus {
  final bool isLoading;
  LoginLoadingButton({required this.isLoading});
}

final class LoginSuccess extends LoginStatus {}

final class LoginError extends LoginStatus {
  final String errorMessage;
  LoginError({required this.errorMessage});
}

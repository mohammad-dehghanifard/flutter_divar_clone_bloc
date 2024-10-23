
sealed class LoginStatus {}

final class LoginInitial extends LoginStatus {}

final class LoginLoadingButton extends LoginStatus {}

final class LoginSuccess extends LoginStatus {}

final class LoginError extends LoginStatus {}

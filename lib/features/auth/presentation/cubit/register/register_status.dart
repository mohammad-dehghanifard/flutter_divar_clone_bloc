
sealed class RegisterStatus {}

final class RegisterInitial extends RegisterStatus {}

final class RegisterLoadingStatus extends RegisterStatus {}

final class RegisterSuccessStatus extends RegisterStatus {

}


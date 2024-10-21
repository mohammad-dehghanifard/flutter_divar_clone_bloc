part of 'splash_cubit.dart';

class SplashState {
  SplashState({required this.splashStatus});
  SplashStatus splashStatus;

  SplashState copyWith({SplashStatus? newStatus}) {
    return SplashState(splashStatus: newStatus ?? splashStatus);
  }
}
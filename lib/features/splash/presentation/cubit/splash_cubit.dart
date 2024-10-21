import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/features/splash/presentation/cubit/splash_status.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(splashStatus: SplashInitial()));
}

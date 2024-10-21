import 'package:flutter_divar_clone_bloc/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void injectDi() {
  serviceLocator.registerSingleton<SplashCubit>(SplashCubit());
}
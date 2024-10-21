import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/utils/storages/shared_preferences_manager.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/auth_page.dart';
import 'package:flutter_divar_clone_bloc/features/splash/presentation/cubit/splash_status.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(splashStatus: SplashInitial()));
  
  
  Future<void> loadingSplash() async {
    emit(state.copyWith(newStatus: SplashLoading()));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(newStatus: SplashLoadingCompleted()));
  }

  void navigateToNextPage({required BuildContext context}) async {
    final prefs = SharedPreferencesManager().preferences;
    final token = prefs!.getString("token");
    if(token != null) {
      // Todo : navigate to home page
    } else {
      Navigator.pushReplacementNamed(context, AuthPage.routeName);
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/cubit/home_status.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(homeStatus: HomeInitial()));
}

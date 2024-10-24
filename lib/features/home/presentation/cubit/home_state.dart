part of 'home_cubit.dart';


class HomeState {
  HomeState({required this.homeStatus});
  HomeStatus homeStatus;

  HomeState copyWith({HomeStatus? newStatus}) {
    return HomeState(homeStatus: newStatus ?? homeStatus);
  }
}
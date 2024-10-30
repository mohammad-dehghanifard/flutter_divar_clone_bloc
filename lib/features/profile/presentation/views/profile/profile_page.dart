import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/profile/profile_view.dart';

class ProfilePage extends StatelessWidget {
  static String routeName = "/profile";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileCubit(),
        child: const ProfileView(),
    );
  }
}

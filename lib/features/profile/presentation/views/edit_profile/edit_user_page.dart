import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/user_model.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/edit_profile/edit_user_view.dart';

class EditUserPage extends StatelessWidget {
  static String routeName = "/editUser";

  const EditUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = ModalRoute.settingsOf(context)?.arguments as UserModel;
    return BlocProvider(
        create: (context) =>  ProfileCubit(),
        child: EditUserView(user: user),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/profile_view.dart';

class ProfilePage extends StatelessWidget {
  static String routeName = "/profile";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

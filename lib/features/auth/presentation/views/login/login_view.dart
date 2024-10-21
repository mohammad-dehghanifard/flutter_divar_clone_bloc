import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/widgets/auth_app_bar_widget.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    const Widget appBar = AuthAppBarWidget(title: "ورود");
    return const Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Distances.bodyMargin),
            child: Column(
              children: [
               appBar
              ],
            ),
          )
      ),
    );
  }
}


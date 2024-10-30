import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/distances.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/page_app_bar_widget.dart';


class EditUserView extends StatelessWidget {
  static String routeName = "/editUser";
  const EditUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PageAppBarWidget(title: "ویرایش پروفایل"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Distances.bodyMargin),
          child: Column(
  
          ),
        ),
      ),
    );
  }
}



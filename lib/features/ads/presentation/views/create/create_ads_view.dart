import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/widgets/page_app_bar_widget.dart';

class CreateAdsView extends StatelessWidget {
  const CreateAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PageAppBarWidget(title: "ایجاد آگهی"),
    );
  }
}

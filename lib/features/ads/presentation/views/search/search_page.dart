import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/search/search_view.dart';

class SearchPage extends StatelessWidget {
  static String routeName = "/search";
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchView();
  }
}

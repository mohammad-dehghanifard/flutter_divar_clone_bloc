import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/ads_list/ads_list_page.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/create/create_ads_page.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/detail/detail_ads_page.dart';
import 'package:flutter_divar_clone_bloc/features/ads/presentation/views/search/search_page.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/auth_view.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/login/login_page.dart';
import 'package:flutter_divar_clone_bloc/features/auth/presentation/views/register/register_page.dart';
import 'package:flutter_divar_clone_bloc/features/category/presentation/views/category_page.dart';
import 'package:flutter_divar_clone_bloc/features/home/presentation/views/home_page.dart';
import 'package:flutter_divar_clone_bloc/features/main/presentation/views/main_page.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/edit_profile/edit_user_page.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/profile/profile_page.dart';
import 'package:flutter_divar_clone_bloc/features/profile/presentation/views/user_ads/user_ads_page.dart';
import 'package:flutter_divar_clone_bloc/features/splash/presentation/views/splash_page.dart';

class RouteManagement {
  RouteManagement._();

  static Map<String, Widget Function(BuildContext)> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    AuthView.routeName: (context) => const AuthView(),
    LoginPage.routeName: (context) => const LoginPage(),
    RegisterPage.routeName: (context) => const RegisterPage(),
    HomePage.routeName: (context) => const HomePage(),
    MainPage.routeName: (context) => const MainPage(),
    DetailAdsPage.routeName: (context) => const DetailAdsPage(),
    CategoryPage.routeName: (context) => const CategoryPage(),
    SearchPage.routeName: (context) => const SearchPage(),
    ProfilePage.routeName: (context) => const ProfilePage(),
    EditUserPage.routeName: (context) => const EditUserPage(),
    CreateAdsPage.routeName: (context) => const CreateAdsPage(),
    AdsListPage.routeName: (context) => const AdsListPage(),
    UserAdsPage.routeName: (context) => const UserAdsPage(),
  };
}
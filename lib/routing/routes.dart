import 'package:empregonaarea/features/edit_information_profile/edit_information_profile.view.dart';
import 'package:empregonaarea/features/first_access/first_access.view.dart';
import 'package:empregonaarea/features/home/home.view.dart';
import 'package:empregonaarea/features/loading_app/loading_app.view.dart';
import 'package:empregonaarea/features/login/login.view.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    LOADING_SCREEN: (_) => const FirstLoadingView(),
    HOME_SCREEN: (_) => const HomeView(),
    EDIT_PROFILE_SCREEN: (_) => const EditProfileView(),
    FIRST_ACCESS_SCREEN: (_) => const FirstAccesView(),
    LOGIN_SCREEN: (_) => LoginView(),
  };

  static const LOADING_SCREEN = "/";
  static const HOME_SCREEN = "/home";
  static const EDIT_PROFILE_SCREEN = "/edit-profile";
  static const FIRST_ACCESS_SCREEN = "/fist-access";
  static const LOGIN_SCREEN = "/login";
}

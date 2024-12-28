import 'package:empregonaarea/components/custom_loading.component.dart';
import 'package:empregonaarea/features/loading_app/loading_app.viewmodel.dart';
import 'package:empregonaarea/features/login/login.viewmodel.dart';
import 'package:empregonaarea/routing/routes.dart';
import 'package:empregonaarea/utils/local_storage_keys.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FirstLoadingView extends StatefulWidget {
  const FirstLoadingView({super.key});

  @override
  State<FirstLoadingView> createState() => _FirstLoadingViewState();
}

class _FirstLoadingViewState extends State<FirstLoadingView> {
  final loadingAppVM = GetIt.I.get<LoadingAppViewModel>();
  final loginVM = GetIt.I.get<LoginViewModel>();
  final userKey = LocalStorageKeys().USER_LOGIN_KEY;

  Future<void> _redirect() async {
    final isLogged = await loadingAppVM.autoLogin(userKey);
    if (!isLogged) {
      await Navigator.pushReplacementNamed(
        context,
        MyRoutes.LOGIN_SCREEN,
      );
    }

    if (loginVM.isFirstUserLogin) {
      Navigator.pushReplacementNamed(
        context,
        MyRoutes.ONBOARDING_SCREEN,
      );
      return;
    }

    await Navigator.pushReplacementNamed(
      context,
      MyRoutes.HOME_SCREEN,
    );
    return;
  }

  @override
  void initState() {
    _redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MyCustomLoading(
          color: Colors.white,
        ),
      ),
    );
  }
}

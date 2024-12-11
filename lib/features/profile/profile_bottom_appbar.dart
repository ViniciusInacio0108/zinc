import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/components/custom_elevated_button.component.dart';
import 'package:empregonaarea/components/custom_modal_bottom_sheet.dart';
import 'package:empregonaarea/features/login/login.viewmodel.dart';
import 'package:empregonaarea/features/profile/profile.viewmodel.dart';
import 'package:empregonaarea/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class BottomProfileAppBar extends StatelessWidget {
  const BottomProfileAppBar({super.key});

  void openExitModal(BuildContext context) {
    final loginVM = GetIt.I.get<LoginViewModel>();
    MyCustomBottonSheet().textWithSingleButton(
      context,
      "Deseja sair da sua conta?",
      Observer(builder: (context) {
        return MyCustomElevatedButton(
          isActivated: loginVM.isLoadingLogginOut ? false : true,
          isLoading: loginVM.isLoadingLogginOut,
          onPressed: () async {
            if (await loginVM.logOut()) {
              Navigator.pushReplacementNamed(
                context,
                MyRoutes.LOGIN_SCREEN,
              );
            }
          },
          label: "Sair",
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileVM = GetIt.I.get<ProfileViewModel>();

    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      profileVM.userName,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                    ),
                    AutoSizeText(
                      profileVM.workTitle,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async => openExitModal(context),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

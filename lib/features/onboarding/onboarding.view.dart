import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/components/custom_elevated_button.component.dart';
import 'package:empregonaarea/features/login/login.viewmodel.dart';
import 'package:empregonaarea/features/onboarding/onboarding.viewmodel.dart';
import 'package:empregonaarea/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final onboardingVM = GetIt.I.get<OnboardingViewModel>();

  Future<void> onGoBackPressed(BuildContext context) async {
    final result = await GetIt.I.get<LoginViewModel>().logOut();

    if (result) {
      Navigator.pushReplacementNamed(context, MyRoutes.LOGIN_SCREEN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Observer(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Stack(
                children: [
                  AutoSizeText(
                    "Vamos começar sua tragetória dentro da Zinc!",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: [
                        AutoSizeText(
                          "Quem é você?",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        MyCustomElevatedButton(
                          isActivated: true,
                          onPressed: () {
                            onboardingVM.setCurrentClientType(ClientType.EMPLOYEE);
                          },
                          label: "Sou trabalhador",
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        MyCustomElevatedButton(
                          isActivated: true,
                          isSecondaryStyle: true,
                          onPressed: () {
                            onboardingVM.setCurrentClientType(ClientType.EMPLOYER);
                          },
                          label: "Sou empresa",
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        if (GetIt.I.get<LoginViewModel>().isLoadingLogginOut)
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        else
                          TextButton(
                            onPressed: () async => onGoBackPressed(context),
                            style: TextButton.styleFrom(),
                            child: AutoSizeText(
                              "Voltar",
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

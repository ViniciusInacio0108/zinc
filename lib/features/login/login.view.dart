import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/components/custom_elevated_button.component.dart';
import 'package:empregonaarea/components/custom_modal.component.dart';
import 'package:empregonaarea/components/custom_text_form.component.dart';
import 'package:empregonaarea/data/models/login_params.model.dart';
import 'package:empregonaarea/features/login/login.viewmodel.dart';
import 'package:empregonaarea/routing/routes.dart';
import 'package:empregonaarea/utils/svg_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final loginVM = GetIt.I.get<LoginViewModel>();

  Future<void> logIN(BuildContext context) async {
    if (loginFormKey.currentState?.validate() != true) {
      return;
    }

    loginFormKey.currentState?.save();
    final loginResponseStatus = await loginVM.login(
      LoginParams(
        email: emailController.text.toLowerCase(),
        password: passwordController.text.toLowerCase(),
      ),
    );

    if (loginResponseStatus == LoginStateResponse.unkownError) {
      const MyCustomFeedbackModal(
              bodyMessage: "Erro desconhecido ao tentar entrar. Por favor, tente novamente.", title: "Atenção!")
          .showModal(context);
      return;
    } else if (loginResponseStatus == LoginStateResponse.invalidCredentials) {
      const MyCustomFeedbackModal(
              bodyMessage: "Senha ou email informados estão incorretos. Por favor, tente novamente.", title: "Atenção!")
          .showModal(context);
      return;
    } else if (loginResponseStatus == LoginStateResponse.emailNotConfirmed) {
      const MyCustomFeedbackModal(
              bodyMessage: "Email não foi confirmado. Por favor, vá até seu email e confirme que ele é realmente seu.",
              title: "Atenção!")
          .showModal(context);
      return;
    } else if (loginVM.isFirstUserLogin) {
      Navigator.pushReplacementNamed(
        context,
        MyRoutes.ONBOARDING_SCREEN,
      );
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      MyRoutes.HOME_SCREEN,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Observer(
        builder: (context) {
          return Center(
            child: Form(
              key: loginFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        SVGURLS.ZINC_LOGO,
                        width: 150,
                      ),
                    ),
                    Center(
                      child: AutoSizeText(
                        "Bem vindo!",
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyCustomTextFormField(
                      controller: emailController,
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      validatorFuncion: loginVM.validateEmailLogin,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MyCustomTextFormField(
                      controller: passwordController,
                      labelText: "Senha",
                      keyboardType: TextInputType.visiblePassword,
                      inputAction: TextInputAction.done,
                      validatorFuncion: loginVM.validateEmailPassword,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (loginVM.isLoggedIn)
                      Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    else
                      MyCustomElevatedButton(
                        onPressed: () async => logIN(context),
                        isActivated: true,
                        label: "Entrar",
                      ),
                    const SizedBox(
                      height: 12,
                    ),
                    MyCustomElevatedButton(
                      isActivated: true,
                      onPressed: () async {
                        await Navigator.pushNamed(
                          context,
                          MyRoutes.FIRST_ACCESS_SCREEN,
                        );
                      },
                      isSecondaryStyle: true,
                      label: "Criar conta",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

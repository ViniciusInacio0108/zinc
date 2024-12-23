import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/components/custom_elevated_button.component.dart';
import 'package:empregonaarea/components/custom_modal_bottom_sheet.dart';
import 'package:empregonaarea/components/custom_text_form.component.dart';
import 'package:empregonaarea/features/first_access/first_acces.viewmodel.dart';
import 'package:empregonaarea/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  final firstAccessVM = GetIt.I.get<FirstAccessViewModel>();

  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> onPressedContinue() async {
    if (_formKey.currentState!.validate()) {
      await firstAccessVM.signUp(emailController.text, passwordController.text);
      await MyCustomBottonSheet().textWithSingleButton(
        context,
        "Uma confirmação foi enviado para o email que você digitou. Vá até seu email e confime que é realmente dono da conta. Logo após, seu login será liberado.",
        MyCustomElevatedButton(
          isActivated: true,
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName(MyRoutes.LOGIN_SCREEN));
          },
          label: "Voltar",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    AutoSizeText(
                      "Crie sua conta!",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyCustomTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      labelText: "Email",
                      inputAction: TextInputAction.next,
                      validatorFuncion: firstAccessVM.validateEmail,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MyCustomTextFormField(
                      controller: passwordController,
                      labelText: "Senha",
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validatorFuncion: firstAccessVM.validatePassword,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MyCustomTextFormField(
                      controller: confirmPasswordController,
                      labelText: "Confirmar senha",
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validatorFuncion: (p0) => firstAccessVM.validateConfirmPassword(p0, passwordController.text),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: MyCustomElevatedButton(
                      isActivated: !firstAccessVM.isLoadingSignUp,
                      isLoading: firstAccessVM.isLoadingSignUp,
                      onPressed: () async => onPressedContinue(),
                      label: "Criar conta",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/components/custom_app_bar.component.dart';
import 'package:empregonaarea/components/custom_confirm_alert_dialog.dart';
import 'package:empregonaarea/components/custom_modal_bottom_sheet.dart';
import 'package:empregonaarea/components/custom_text_form.component.dart';
import 'package:empregonaarea/features/profile/profile.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final aboutController = TextEditingController();
  final numberController = TextEditingController();
  final workTitleController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  final profileVM = GetIt.I.get<ProfileViewModel>();

  void setAllTextFields() {
    aboutController.text = profileVM.about;
    numberController.text = profileVM.number;
    workTitleController.text = profileVM.workTitle;
  }

  @override
  void initState() {
    setAllTextFields();
    super.initState();
  }

  @override
  void dispose() {
    aboutController.dispose();
    numberController.dispose();
    workTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            label: (profileVM.isUpdatingUserData)
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                : Text(
                    "Salvar informações",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
            elevation: 1,
            isExtended: true,
            onPressed: () async {
              await MyConfirmAlertDialog().callAlertToConfirm(
                context,
                title: "Tem certeza que deseja editar?",
                onConfirm: () async {
                  await profileVM
                      .editUserData(
                        context,
                        profileVM.profile.copyWith(
                          about: aboutController.text,
                          number: numberController.text,
                          workTitle: workTitleController.text,
                        ),
                      )
                      .then(
                        (_) => MyCustomBottonSheet().callFeedbackText(context, profileVM.editUserFeedbackMessage),
                      );
                },
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          appBar: const MyAppBar(title: "Editar informações"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Sobre",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MyCustomTextFormField(
                      controller: aboutController,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      maxLength: 1000,
                      maxLines: 10,
                      validatorFuncion: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AutoSizeText(
                      "Número",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MyCustomTextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.next,
                      validatorFuncion: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AutoSizeText(
                      "Título de trabalho",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MyCustomTextFormField(
                      controller: workTitleController,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validatorFuncion: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

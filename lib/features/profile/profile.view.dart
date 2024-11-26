import 'package:auto_size_text/auto_size_text.dart';
import 'package:empregonaarea/features/edit_information_profile/edit_information_profile.view.dart';
import 'package:empregonaarea/features/profile/profile.viewmodel.dart';
import 'package:empregonaarea/interfaces/text_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Future<void> goToEditProfile(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EditProfileView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileVM = GetIt.I.get<ProfileViewModel>();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Editar informações",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
        ),
        elevation: 1,
        isExtended: true,
        onPressed: () async {
          await goToEditProfile(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                AutoSizeText(
                  profileVM.about,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                AutoSizeText(
                  "Contato",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                AutoSizeText(
                  "Número: ${TextFormating(profileVM.number).numberFormating()}",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                AutoSizeText(
                  "Email: ${profileVM.email}",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

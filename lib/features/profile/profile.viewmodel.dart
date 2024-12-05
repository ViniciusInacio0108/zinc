import 'package:empregonaarea/data/models/profile.model.dart';
import 'package:empregonaarea/data/repositories/profile/profile.repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'profile.viewmodel.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  final ProfileRepository profileRepo;

  _ProfileViewModelBase({required this.profileRepo});

  @observable
  ProfileModel profile = ProfileModel();

  @observable
  String userIdFromAuth = "";

  @observable
  bool isFetchingData = false;

  @observable
  bool isUpdatingUserData = false;

  @action
  void setUserIdFromAuth(String id) {
    userIdFromAuth = id;
  }

  @computed
  String get userName => profile.name ?? "";

  @computed
  String get userPicture => profile.picture_url ?? "";

  @computed
  String get workTitle => profile.workTitle ?? "";

  @computed
  String get about => profile.about ?? "";

  @computed
  String get number => profile.number ?? "";

  @computed
  String get email => profile.email ?? "";

  @action
  Future<void> fetchUserData() async {
    isFetchingData = true;
    final res = await profileRepo.getUserData(userIdFromAuth);
    profile = res;
    isFetchingData = false;
  }

  @observable
  String editUserFeedbackMessage = "";

  @action
  Future<void> editUserData(BuildContext context, ProfileModel editedModel) async {
    try {
      if (editedModel == profile) {
        editUserFeedbackMessage = "Atenção! Dados não foram alterados por falta de mudanças.";
        return;
      }

      isUpdatingUserData = true;

      final res = await profileRepo.updateUserData(profile.id ?? "", editedModel);

      profile = res;

      editUserFeedbackMessage = "Dados alterados com sucesso!";
    } catch (e) {
      editUserFeedbackMessage = e.toString();
    } finally {
      isUpdatingUserData = false;
    }
  }
}

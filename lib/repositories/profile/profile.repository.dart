import 'package:empregonaarea/data/models/profile.model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getUserData(String id);
  Future<ProfileModel> updateUserData(String id, ProfileModel updatedModel);
}

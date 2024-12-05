import 'package:empregonaarea/data/models/profile.model.dart';
import 'package:empregonaarea/main.dart';
import 'package:empregonaarea/data/repositories/profile/profile.repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  static const PROFILE_TABLE_NAME = "profile";

  @override
  Future<ProfileModel> getUserData(String id) async {
    final res = await supabase.from(PROFILE_TABLE_NAME).select("*").eq("userId", id);
    if (res.isEmpty) return ProfileModel();

    return ProfileModel.fromMap(res.first);
  }

  @override
  Future<ProfileModel> updateUserData(String id, ProfileModel updatedModel) async {
    final updatedMap = updatedModel.toMap();

    // see why email is a problem to change
    final res = await supabase.from(PROFILE_TABLE_NAME).update(updatedMap).eq("id", id).select();

    return ProfileModel.fromMap(res.first);
  }
}

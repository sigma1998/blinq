// Project imports:
import 'package:blinq/data/datasource/local/profile_local_db.dart';
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/data/model/profile/profile_response_model.dart';

abstract class ProfileRepository {
  Future<ProfileResponseModel> fetchProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApi api;
  final ProfileLocalStorage localStorage;

  ProfileRepositoryImpl({required this.api, required this.localStorage});

  @override
  Future<ProfileResponseModel> fetchProfile() async {
    try {
      return await api.fetchProfile();
    } catch (e) {
      rethrow;
    }
  }
}

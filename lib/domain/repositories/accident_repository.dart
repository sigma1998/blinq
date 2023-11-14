// Project imports:
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/datasource/remote/accident_api.dart';

abstract class AccidentRepository {
  ///
  /// Remote API
  ///
  Future<ProfileResponseModel> fetchUserById(int id);
}

class AccidentRepositoryImpl implements AccidentRepository {
  //
  final AccidentApi api;

  AccidentRepositoryImpl({required this.api});

  @override
  Future<ProfileResponseModel> fetchUserById(int id) async {
    try {
      return await api.fetchUserById(id);
    } catch (e) {
      rethrow;
    }
  }
}

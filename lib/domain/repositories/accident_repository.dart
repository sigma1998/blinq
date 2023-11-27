// Project imports:
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/datasource/remote/accident_api.dart';

abstract class AccidentRepository {
  ///
  /// Remote API
  ///
  Future<ProfileResponseModel> fetchUserById(int id);

  Future<int> createAccident(String long, String lat);
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


  @override
  Future<int> createAccident(String long, String lat) async{
    try{
      return await api.createAccident(long, lat);
    }catch(e){
      rethrow;
    }
  }
}

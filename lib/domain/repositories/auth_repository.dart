import 'package:blinq/data/datasource/local/local_db.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';

abstract class AuthRepository{

}

class AuthRepositoryImpl implements AuthRepository{
  final AuthApi api;
  final LocalStorage localStorage;

  AuthRepositoryImpl({required this.api, required this.localStorage});


}
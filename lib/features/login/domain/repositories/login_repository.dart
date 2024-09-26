import 'package:dartz/dartz.dart';
import 'package:move_mate/features/login/data/models/request/login_request.dart';
import 'package:move_mate/features/login/data/models/response/login_response.dart';

abstract class LoginRepository {
  Future<Either<dynamic,AuthReponseModel>> login(LoginRequest loginRequest);
}
import 'package:dartz/dartz.dart';
import 'package:move_mate/features/login/data/datasources/login_service.dart';
import 'package:move_mate/features/login/data/models/request/login_request.dart';
import 'package:move_mate/features/login/data/models/response/login_response.dart';
import 'package:move_mate/features/login/domain/repositories/login_repository.dart';
import 'package:move_mate/service_locator.dart';

class LoginRepositoryImpl  extends LoginRepository {
  @override
  Future<Either<dynamic, AuthReponseModel>> login(
      LoginRequest loginRequest) async {
        return sl<LoginService>().login(loginRequest);
  }
}

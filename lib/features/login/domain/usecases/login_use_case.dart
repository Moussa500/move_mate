import 'package:dartz/dartz.dart';
import 'package:move_mate/core/usecases/usecases.dart';
import 'package:move_mate/features/login/data/models/request/login_request.dart';
import 'package:move_mate/features/login/data/models/response/login_response.dart';
import 'package:move_mate/features/login/domain/repositories/login_repository.dart';
import 'package:move_mate/service_locator.dart';

class LoginUseCase extends UseCase<AuthReponseModel,LoginRequest> {
  @override
  Future<Either<dynamic,AuthReponseModel>> call(LoginRequest params) {
    return sl<LoginRepository>().login(params);
  }
  
}
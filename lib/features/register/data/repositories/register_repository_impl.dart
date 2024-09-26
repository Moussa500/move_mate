import 'package:dartz/dartz.dart';
import 'package:move_mate/features/register/data/data%20sources/register_service.dart';
import 'package:move_mate/features/register/data/models/request/register_request.dart';
import 'package:move_mate/features/register/data/models/response/register_response.dart';
import 'package:move_mate/features/register/domain/repositories/register_repository.dart';
import 'package:move_mate/service_locator.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  @override
  Future<Either<dynamic, AuthReponseModel>> registerUser(
      RegisterRequest registerRequest) async {
    return await sl<RegisterService>().register(registerRequest);
  }
}

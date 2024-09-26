import 'package:dartz/dartz.dart';
import 'package:move_mate/core/usecases/usecases.dart';
import 'package:move_mate/features/register/data/models/request/register_request.dart';
import 'package:move_mate/features/register/domain/repositories/register_repository.dart';
import 'package:move_mate/service_locator.dart';

class RegisterUseCase extends UseCase<Either, RegisterRequest> {
  @override
  Future<Either> call(RegisterRequest params) {
    return sl<RegisterRepository>().registerUser(params);
  }
}
 
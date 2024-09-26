import 'package:dartz/dartz.dart';
import 'package:move_mate/features/register/data/models/request/register_request.dart';
import 'package:move_mate/features/register/data/models/response/register_response.dart';

abstract class RegisterRepository {
  Future<Either<dynamic,AuthReponseModel>> registerUser(RegisterRequest registerRequest);
}
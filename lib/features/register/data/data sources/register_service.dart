import 'package:dartz/dartz.dart';
import 'package:move_mate/core/base/base_repository.dart';
import 'package:move_mate/core/constants/api_constants.dart';
import 'package:move_mate/features/register/data/models/request/register_request.dart';
import 'package:move_mate/features/register/data/models/response/register_response.dart';

abstract class RegisterService {
  Future<Either<dynamic, AuthReponseModel>> register(
      RegisterRequest registerRequest);
}

class RegisterServiceImpl extends MainRepository implements RegisterService {
  RegisterServiceImpl(
      {required super.remoteData,
      required super.localData,
      required super.networkInfo});

  @override
  Future<Either<dynamic, AuthReponseModel>> register(
      RegisterRequest registerRequest) async {
    final result = await data(
        needCash: false,
        getData: () => remoteData.post(
            model: AuthReponseModel(),
            body: registerRequest.toJson(),
            path: ApiConstants.register,
            headers: headerNoToken()));
    return result.fold((failure) {
      return Left(failure);
    }, (authResponse) {
      return Right(authResponse);
    });
  }
}

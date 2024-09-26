import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:move_mate/core/base/base_repository.dart';
import 'package:move_mate/core/constants/api_constants.dart';
import 'package:move_mate/core/route/app_routes.dart';
import 'package:move_mate/features/login/data/models/request/login_request.dart';
import 'package:move_mate/features/login/data/models/response/login_response.dart';

abstract class LoginService {
  Future<Either<dynamic, AuthReponseModel>> login(LoginRequest loginRequest);
}

class LoginServiceImpl extends MainRepository implements LoginService {
  LoginServiceImpl(
      {required super.remoteData,
      required super.localData,
      required super.networkInfo});
  @override
  Future<Either<dynamic, AuthReponseModel>> login(
      LoginRequest loginRequest) async {
    final result = await data(
      cashData: (data){
        localData.saveAtring(data.accessToken,ApiConstants.accessToken);
        localData.saveAtring(data.refreshToken,ApiConstants.refreshToken);
      },
      getData: () => remoteData.post(
          model: AuthReponseModel(),
          body: loginRequest.toJson(),
          path: ApiConstants.login,
          headers: headerNoToken()),
      needCash: true,
    );
    return result.fold((failure) {
      log(failure);
      return Left(failure);
    }, (authResponse) => Right(authResponse));
  }
}

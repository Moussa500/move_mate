import 'package:dartz/dartz.dart';
import 'package:move_mate/core/base/base_repository.dart';
import 'package:move_mate/core/constants/api_constants.dart';
import 'package:move_mate/core/error/failure.dart';
import 'package:move_mate/features/houses_list/data/models/rented_houses_model.dart';
import 'package:move_mate/features/houses_list/data/models/selled_houses_model.dart';

abstract class HousesService {
  Future<Either<dynamic, List<RentedHouses>>> getRentedHouses();
  Future<Either<dynamic, List<SelledHouse>>> getSelledHouses();
}

class HousesServiceImpl extends MainRepository implements HousesService {
  HousesServiceImpl(
      {required super.remoteData,
      required super.localData,
      required super.networkInfo});

  @override
  Future<Either<dynamic, List<RentedHouses>>> getRentedHouses() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      final result = await data(
        getData: () => remoteData.get(
          path: ApiConstants.rentedHousesList,
          model: RentedHouses(),
        ),
        needCash: false,
      );
      return result.fold((l) {
        return Left(l);
      }, (houses) {
        return Right(houses as List<RentedHouses>);
      });
    } else {
      return Left(NetworkFailure("You are offline"));
    }
  }

  @override
  Future<Either<dynamic, List<SelledHouse>>> getSelledHouses() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      final result = await data(
        getData: () => remoteData.get(
            path: ApiConstants.selledHousesList,
            model: SelledHouse(),
            headers: headers),
        needCash: false,
      );
      return result.fold((l) => Left(l), (houses) => Right(houses));
    } else {
      return Left(NetworkFailure("You are offline"));
    }
  }
}

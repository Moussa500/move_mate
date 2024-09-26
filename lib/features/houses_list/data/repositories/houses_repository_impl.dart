import 'package:dartz/dartz.dart';
import 'package:move_mate/features/houses_list/data/datasources/houses_service.dart';
import 'package:move_mate/features/houses_list/data/models/rented_houses_model.dart';
import 'package:move_mate/features/houses_list/data/models/selled_houses_model.dart';
import 'package:move_mate/features/houses_list/domain/repositories/houses_repository.dart';
import 'package:move_mate/service_locator.dart';

class HousesRepositoryImpl extends HousesRepository {
  @override
  Future<Either<dynamic, List<RentedHouses>>> getRentedHouses() {
    return sl<HousesService>().getRentedHouses();
  }

  @override
  Future<Either<dynamic, List<SelledHouse>>> getSelledHouses() {
    return sl<HousesService>().getSelledHouses();
  }
}

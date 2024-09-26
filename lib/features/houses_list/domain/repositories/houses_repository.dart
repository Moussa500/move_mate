import 'package:dartz/dartz.dart';
import 'package:move_mate/features/houses_list/data/models/rented_houses_model.dart';
import 'package:move_mate/features/houses_list/data/models/selled_houses_model.dart';

abstract class HousesRepository {
  Future<Either<dynamic,List<RentedHouses>>> getRentedHouses();
  Future<Either<dynamic,List<dynamic>>> getSelledHouses();
}
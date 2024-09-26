import 'package:dartz/dartz.dart';
import 'package:move_mate/core/usecases/usecases.dart';
import 'package:move_mate/features/houses_list/domain/repositories/houses_repository.dart';
import 'package:move_mate/service_locator.dart';

class RentedHousesUsecase extends UseCase<dynamic,NoParams> {
  @override
  Future<Either> call(params) {
    return sl<HousesRepository>().getRentedHouses();
  }
}
class getSelledHouses {
  
}
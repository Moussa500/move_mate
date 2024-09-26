import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:move_mate/core/usecases/usecases.dart';
import 'package:move_mate/features/houses_list/data/models/rented_houses_model.dart';
import 'package:move_mate/features/houses_list/domain/usecases/houses_usecases.dart';
import 'package:move_mate/service_locator.dart';

part 'houses_list_event.dart';
part 'houses_list_state.dart';

class HousesListBloc extends Bloc<HousesListEvent, HousesListState> {
  HousesListBloc() : super(HousesListInitial()) {
    on<HousesListEvent>(_onHousesFetched);
  }
  Future<void> _onHousesFetched(
      HousesListEvent event, Emitter<HousesListState> emit) async {
    try {
      if (event is GetRentedHousesList) {
        emit(HousesListLoading());
        final houses = await sl<RentedHousesUsecase>().call(NoParams());
        houses.fold((l) {
          emit(HousesListFail());
        }, (r) {
          emit(RentedHousesListLoaded(r as List<RentedHouses>));
        });
      }
    } catch (e) {
      emit(HousesListFail());
      print("Error:$e");
    }
  }
}

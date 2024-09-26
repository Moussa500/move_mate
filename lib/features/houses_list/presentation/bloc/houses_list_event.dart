part of 'houses_list_bloc.dart';

abstract class HousesListEvent extends Equatable {
  const HousesListEvent();

  @override
  List<Object> get props => [];
}
class GetRentedHousesList extends HousesListEvent {
  const GetRentedHousesList():super();
}

class GetSelledHousesList extends HousesListEvent {
  const GetSelledHousesList():super();
}
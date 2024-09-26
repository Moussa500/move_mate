part of 'houses_list_bloc.dart';

abstract class HousesListState extends Equatable {
  const HousesListState();

  @override
  List<Object> get props => [];
}

class HousesListInitial extends HousesListState {}

class HousesListLoading extends HousesListState {}

class HousesListFail extends HousesListState {}

class RentedHousesListLoaded extends HousesListState {
  final List<RentedHouses> houses;
  const RentedHousesListLoaded(this.houses);
}

class SelledHousesListLoaded extends HousesListState {
  final List<dynamic> houses;
  const SelledHousesListLoaded(this.houses);
}

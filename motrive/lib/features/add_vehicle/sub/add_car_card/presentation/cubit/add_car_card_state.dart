import 'package:equatable/equatable.dart';
import 'package:motrive/features/add_vehicle/sub/add_car_card/domain/entities/add_car_card_entity.dart';

abstract class AddCarCardState extends Equatable {
  final List<AddCarCardEntity> vehicles;
  final List<CarInfoEntity> carsInfo;
  final bool isLoading;

  const AddCarCardState({
    this.vehicles = const [],
    this.carsInfo = const [],
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [vehicles, carsInfo, isLoading];
}

class AddCarCardInitialState extends AddCarCardState {}
class VehiclesLoadingState extends AddCarCardState {}
class AddCarCardLoadedState extends AddCarCardState {
  @override
  final List<AddCarCardEntity> vehicles;
  const AddCarCardLoadedState(this.vehicles);
  @override
  List<Object?> get props => [vehicles];
}

class AddCarCardErrorState extends AddCarCardState {
  final String message;
  const AddCarCardErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

class CarsInfoLoadingState extends AddCarCardState {}
class CarInfoLoadedState extends AddCarCardState {
  final List<CarInfoEntity> cars;
  const CarInfoLoadedState(this.cars);
  @override
  List<Object?> get props => [cars];
}

class SearchResultState extends AddCarCardState {
  final List<BaseCarEntity> results;
  const SearchResultState(this.results);
  @override
  List<Object?> get props => [results];
}
import 'package:equatable/equatable.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/entities/cars_info_entity.dart';

abstract class CarsInfoState extends Equatable {
  const CarsInfoState();

  @override
  List<Object?> get props => [];
}

class CarsInfoInitialState extends CarsInfoState {}
class CarsInfoLoadingState extends CarsInfoState {}


class CarsInfoSuccessState extends CarsInfoState {
  final List<CarsInfoEntity> cars;

  const CarsInfoSuccessState({required this.cars});

  @override
  List<Object?> get props => [cars];
}

class CarsInfoErrorState extends CarsInfoState {
  final String message;
  const CarsInfoErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

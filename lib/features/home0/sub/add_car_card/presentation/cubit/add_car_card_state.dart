import 'package:equatable/equatable.dart';

abstract class AddCarCardState extends Equatable {
  const AddCarCardState();

  @override
  List<Object?> get props => [];
}

class AddCarCardInitialState extends AddCarCardState {}
class AddCarCardSuccessState extends AddCarCardState {}

class AddCarCardErrorState extends AddCarCardState {
  final String message;
  const AddCarCardErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}


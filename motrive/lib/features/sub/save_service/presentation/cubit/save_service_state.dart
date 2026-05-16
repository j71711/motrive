import 'package:equatable/equatable.dart';

abstract class SaveServiceState extends Equatable {
  const SaveServiceState();

  @override
  List<Object?> get props => [];
}

class SaveServiceInitialState extends SaveServiceState {}
class SaveServiceSuccessState extends SaveServiceState {}
class SaveServiceLoadingState extends SaveServiceState {}


class SaveServiceErrorState extends SaveServiceState {
  final String message;
  const SaveServiceErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}


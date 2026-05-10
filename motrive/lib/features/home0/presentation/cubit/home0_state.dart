import 'package:equatable/equatable.dart';

abstract class Home0State extends Equatable {
  const Home0State();

  @override
  List<Object?> get props => [];
}

class Home0InitialState extends Home0State {}
class Home0SuccessState extends Home0State {}

class Home0ErrorState extends Home0State {
  final String message;
  const Home0ErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}


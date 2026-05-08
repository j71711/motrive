import 'package:equatable/equatable.dart';

class Home0Entity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;

  const Home0Entity({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [firstName, lastName, id];
}

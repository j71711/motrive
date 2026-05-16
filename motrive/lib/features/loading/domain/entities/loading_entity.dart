import 'package:equatable/equatable.dart';

class LoadingEntity extends Equatable {
  final bool isLogin;
  final bool? isUser;

  const LoadingEntity({required this.isLogin, this.isUser});

  @override
  List<Object?> get props => [isLogin, isUser];
}

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;
  final String userName;

  const User(
      {required this.email, required this.password, required this.userName});

  @override
  List<Object?> get props => [email, password, userName];
}

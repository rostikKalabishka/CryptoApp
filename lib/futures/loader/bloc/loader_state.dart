part of 'loader_bloc.dart';

sealed class LoaderState extends Equatable {
  const LoaderState();

  @override
  List<Object> get props => [];
}

final class LoaderInitial extends LoaderState {}

class LoadUserAuthLoader extends LoaderState {
  final User user;

  const LoadUserAuthLoader({required this.user});
  @override
  List<Object> get props => super.props..add(user);
}

class LoaderFailure extends LoaderState {
  final Object error;

  const LoaderFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}

// enum AuthenticationStatus { authenticated, unauthenticated, unknown }

// class AuthenticationState extends Equatable {
//   const AuthenticationState._(
//       {this.status = AuthenticationStatus.unknown, this.user});

//   const AuthenticationState.unknown() : this._();

//   const AuthenticationState.authenticated(User user)
//       : this._(status: AuthenticationStatus.authenticated, user: user);

//   const AuthenticationState.unauthenticated()
//       : this._(status: AuthenticationStatus.unauthenticated);

//   final AuthenticationStatus status;
//   final User? user;

//   @override
//   List<Object?> get props => [status, user];
// }

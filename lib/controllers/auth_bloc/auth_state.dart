part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class UserLoggedInState extends AuthState {
  const UserLoggedInState({required this.user});
  final User user;
}

final class UserLoggedOutState extends AuthState {}

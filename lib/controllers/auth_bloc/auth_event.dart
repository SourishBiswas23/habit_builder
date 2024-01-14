part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class SignInWithGoogleEvent extends AuthEvent {}

final class SignInWithEmailIdAndPasswordEvent extends AuthEvent {
  const SignInWithEmailIdAndPasswordEvent({
    required this.emailId,
    required this.password,
  });
  final String emailId;
  final String password;
}

final class CreateUserWithEmailAndPasswordEvent extends AuthEvent {
  const CreateUserWithEmailAndPasswordEvent({
    required this.emailId,
    required this.password,
  });
  final String emailId;
  final String password;
}

final class SignOutEvent extends AuthEvent {}

final class SendPasswordResetEmailEvent extends AuthEvent {
  const SendPasswordResetEmailEvent({required this.emailId});
  final String emailId;
}

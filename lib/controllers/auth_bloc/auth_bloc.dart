import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

import '../../auth/auth.dart';
import '../../routes.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInWithGoogleEvent>((event, emit) async {
      try {
        await _auth.signInWithGoogle();
        if (await _auth.isSignedIn()) {
          emit(UserLoggedInState(user: _auth.currentUser!));
          AppNavigator.pushReplace(appRoute: AppRoute.bottomNavBarScreen);
        } else {
          emit(UserLoggedOutState());
        }
      } catch (e) {
        _logger.i(e.toString());
        rethrow;
      }
    });
    on<SignInWithEmailIdAndPasswordEvent>((event, emit) async {
      try {
        await _auth.signInWithEmailAndPassword(
          emailId: event.emailId.trim(),
          password: event.password.trim(),
        );
        if (await _auth.isSignedIn()) {
          emit(UserLoggedInState(user: _auth.currentUser!));
          AppNavigator.pushReplace(appRoute: AppRoute.bottomNavBarScreen);
        } else {
          emit(UserLoggedOutState());
        }
      } catch (e) {
        _logger.i(e.toString());
        rethrow;
      }
    });
    on<CreateUserWithEmailAndPasswordEvent>(
      (event, emit) async {
        try {
          await _auth.registerWithEmailAndPassword(
            emailId: event.emailId.trim(),
            password: event.password.trim(),
          );
          if (await _auth.isSignedIn()) {
            emit(UserLoggedInState(user: _auth.currentUser!));
            AppNavigator.pushReplace(appRoute: AppRoute.bottomNavBarScreen);
          } else {
            emit(UserLoggedOutState());
          }
        } catch (e) {
          _logger.i(e.toString());
          rethrow;
        }
      },
    );
    on<SignOutEvent>(
      (event, emit) async {
        try {
          await _auth.signOut();
          if (!await _auth.isSignedIn()) {
            emit(UserLoggedOutState());
            AppNavigator.pushReplace(appRoute: AppRoute.loginScreen);
          }
        } catch (e) {
          _logger.i(e.toString());
          rethrow;
        }
      },
    );
    on<SendPasswordResetEmailEvent>(
      (event, emit) async {
        try {
          await _auth.sendPasswordResetEmail(
            emailId: event.emailId.trim(),
          );
        } catch (e) {
          _logger.i(e.toString());
          rethrow;
        }
      },
    );
  }
  final Auth _auth = Auth();
  final Logger _logger = Logger();
}

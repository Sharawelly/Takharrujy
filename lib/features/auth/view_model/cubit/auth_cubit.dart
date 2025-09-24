import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takharrujy/features/auth/data/models/user_model.dart';

import '../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String role,
    required String university,
  }) async {
    try {
      emit(AuthLoading());

      final result = await _authRepository.register(
        name: name,
        email: email,
        password: password,
        role: role,
        university: university,
      );

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (user) => emit(AuthSuccess(user)),
      );
    } catch (e) {
      emit(AuthError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoading());

      final result = await _authRepository.login(
        email: email,
        password: password,
      );

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (user) => emit(AuthSuccess(user)),
      );
    } catch (e) {
      emit(AuthError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthLoading());

      await _authRepository.logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      emit(AuthLoading());

      final result = await _authRepository.forgotPassword(email);

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (success) => emit(AuthPasswordResetSent()),
      );
    } catch (e) {
      emit(AuthError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  void resetState() {
    emit(AuthInitial());
  }
}













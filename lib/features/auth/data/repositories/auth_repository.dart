import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
    required String role,
    required String university,
  });

  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<Either<Failure, bool>> forgotPassword(String email);

  Future<Either<Failure, User?>> getCurrentUser();
}

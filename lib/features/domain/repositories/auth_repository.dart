import 'package:dartz/dartz.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:test_app/features/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(Map<String, dynamic> params);
  Future<Either<Failure, bool>> register(Map<String, dynamic> params);
  Future<Either<Failure, String>> getToken();
  Future<Either<Failure, bool>> clearAll();
}

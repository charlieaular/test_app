import 'package:test_app/features/data/datasources/auth_local_datasource.dart';
import 'package:test_app/features/domain/entities/user_entity.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test_app/features/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart' show required;

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource authLocalDatasource;

  AuthRepositoryImpl({@required this.authLocalDatasource});

  @override
  Future<Either<Failure, UserEntity>> login(Map<String, dynamic> params) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      UserEntity user = authLocalDatasource.login(params);
      return Right(user);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> register(Map<String, dynamic> params) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      bool registered = authLocalDatasource.register(params);
      return Right(registered);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      String token = await authLocalDatasource.getToken();
      return Right(token);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> clearAll() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      bool cleared = await authLocalDatasource.clearAll();
      return Right(cleared);
    } catch (e) {
      return Left(e);
    }
  }
}

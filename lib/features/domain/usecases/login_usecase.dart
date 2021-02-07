import 'package:test_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test_app/core/usecases/use_case.dart';
import 'package:test_app/features/domain/entities/user_entity.dart';
import 'package:test_app/features/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<UserEntity, Map<String, dynamic>> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(Map<String, dynamic> params) async {
    return await repository.login(params);
  }
}

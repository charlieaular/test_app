import 'package:test_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test_app/core/usecases/use_case.dart';
import 'package:test_app/features/domain/repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<bool, Map<String, dynamic>> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Map<String, dynamic> params) async {
    return await repository.register(params);
  }
}

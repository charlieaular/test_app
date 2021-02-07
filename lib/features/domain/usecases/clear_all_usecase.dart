import 'package:dartz/dartz.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:test_app/core/usecases/use_case.dart';
import 'package:test_app/features/domain/repositories/auth_repository.dart';

class ClearAllUseCase implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  ClearAllUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    return await repository.clearAll();
  }
}

import 'package:dartz/dartz.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:test_app/core/usecases/use_case.dart';
import 'package:test_app/features/domain/repositories/auth_repository.dart';

class GetTokenUseCase implements UseCase<String, NoParams> {
  final AuthRepository repository;

  GetTokenUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams noParams) async {
    return await repository.getToken();
  }
}

import 'package:test_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test_app/core/usecases/use_case.dart';
import 'package:test_app/features/domain/entities/restaurant_entity.dart';
import 'package:test_app/features/domain/repositories/places_repository.dart';

class GetRestaurantsUseCase
    implements UseCase<List<RestaurantEntity>, Map<String, dynamic>> {
  final PlacesRepository repository;

  GetRestaurantsUseCase(this.repository);

  @override
  Future<Either<Failure, List<RestaurantEntity>>> call(
      Map<String, dynamic> params) async {
    return await repository.getRestaurants(params);
  }
}

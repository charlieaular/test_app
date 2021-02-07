import 'package:dartz/dartz.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:test_app/features/domain/entities/restaurant_entity.dart';

abstract class PlacesRepository {
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants(
      Map<String, dynamic> params);
}

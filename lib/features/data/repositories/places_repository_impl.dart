import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/features/data/datasources/places_remote_datasource.dart';
import 'package:test_app/features/domain/entities/restaurant_entity.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:test_app/features/domain/repositories/places_repository.dart';
import 'package:meta/meta.dart' show required;

class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesRemoteDataSource placesRemoteDataSource;

  PlacesRepositoryImpl({@required this.placesRemoteDataSource});

  @override
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants(
      Map<String, dynamic> params) async {
    try {
      final res = await placesRemoteDataSource.getRestaurants(params);
      return Right(res);
    } catch (e) {
      return Left(e);
    }
  }
}

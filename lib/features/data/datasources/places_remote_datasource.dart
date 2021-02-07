import 'package:dio/dio.dart';
import 'package:test_app/core/api_provider.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:test_app/features/data/models/restaurant_model.dart';

abstract class PlacesRemoteDataSource {
  Future<List<RestaurantModel>> getRestaurants(Map<String, dynamic> params);
}

class PlacesRemoteDataSourceImpl extends ApiProvider
    implements PlacesRemoteDataSource {
  @override
  Future<List<RestaurantModel>> getRestaurants(
      Map<String, dynamic> params) async {
    try {
      params["result_types"] = "place,category";
      params["at"] = "7.0168,-73.1004";
      params["Accept-Language"] = "es-ES,es;q=0.9";
      params["app_id"] = "j34iQXfEzmJzbjr7RShi";
      params["app_code"] = "To6EH2njs7mESwN8M0WmOw";

      final res = await dio.get(
          "https://places.ls.hereapi.com/places/v1/autosuggest",
          queryParameters: params);
      return (res.data["results"] as List)
          .map((e) => RestaurantModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw ServerFailure(message: e.error);
    }
  }
}

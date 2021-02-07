import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:test_app/features/domain/entities/restaurant_entity.dart';
import 'package:test_app/features/domain/usecases/get_restaurants_usecase.dart';
import 'package:meta/meta.dart' show required;

class HomeController extends GetxController {
  final GetRestaurantsUseCase _getRestaurantsUseCase;

  HomeController({@required GetRestaurantsUseCase getRestaurantsUseCase})
      : assert(getRestaurantsUseCase != null),
        _getRestaurantsUseCase = getRestaurantsUseCase;

  onInit() {
    currentPosition();
    super.onInit();
  }

  List<RestaurantEntity> listRestaurants = List<RestaurantEntity>();

  Timer _debounce;

  bool loading = false;

  onTextChange(String value) {
    loading = true;
    update(['listRestaurants']);
    if (_debounce?.isActive ?? false) _debounce.cancel();

    _debounce = Timer(Duration(milliseconds: 500), () async {
      Map<String, dynamic> params = {
        "q": value,
      };
      Either<Failure, List<RestaurantEntity>> res =
          await _getRestaurantsUseCase.call(params);
      res.fold((l) {
        Get.snackbar('Error', 'Unexpected error');
      }, (r) {
        listRestaurants.clear();
        listRestaurants.addAll(r);
      });
      loading = false;
      update(['listRestaurants']);
    });
  }

  Position position;

  currentPosition() async {
    Position position = await _determinePosition();
    this.position = position;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}

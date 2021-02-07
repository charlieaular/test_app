import 'package:test_app/features/domain/entities/restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  RestaurantModel({
    String id,
    String title,
  }) : super(
          id: id,
          title: title,
        );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      title: json['title'],
    );
  }
}

import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
  final String id;
  final String title;

  RestaurantEntity({
    this.id,
    this.title,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        this.id,
        this.title,
      ];
}

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String username;
  final String password;

  UserEntity({
    this.name,
    this.username,
    this.password,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        this.name,
        this.username,
        this.password,
      ];
}

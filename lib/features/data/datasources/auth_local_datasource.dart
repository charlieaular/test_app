import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/api_provider.dart';
import 'package:test_app/features/data/models/user_model.dart';
import 'package:meta/meta.dart' show required;

abstract class AuthLocalDatasource {
  UserModel login(Map<String, dynamic> params);
  bool register(Map<String, dynamic> parmas);
  Future<String> getToken();
  Future<bool> clearAll();
}

class AuthLocalDatasourceImpl extends ApiProvider
    implements AuthLocalDatasource {
  final List<UserModel> users = [
    UserModel(name: "Charlie", password: "123456", username: "charlie"),
  ];

  final SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl({@required this.sharedPreferences});

  @override
  UserModel login(Map<String, dynamic> params) {
    UserModel user = users.firstWhere(
        (el) =>
            el.username == params['username'] &&
            el.password == params['password'],
        orElse: () => null);

    if (user != null) setToken('token');
    return user;
  }

  @override
  bool register(Map<String, dynamic> parmas) {
    UserModel newUser = UserModel.fromJson(parmas);
    users.add(newUser);
    setToken('token');
    return true;
  }

  void setToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  Future<String> getToken() async {
    return await sharedPreferences.getString('token');
  }

  Future<bool> clearAll() async {
    return await sharedPreferences.clear();
  }
}

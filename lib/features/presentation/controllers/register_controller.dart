import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:test_app/features/domain/usecases/register_usecase.dart';
import 'package:meta/meta.dart' show required;
import 'package:test_app/features/presentation/home/home_page.dart';

class RegisterController extends GetxController {
  final RegisterUseCase _registerUseCase;

  RegisterController({@required RegisterUseCase registerUseCase})
      : assert(registerUseCase != null),
        _registerUseCase = registerUseCase;

  String name = "";
  String username = "";
  String password = "";
  bool loading = false;

  onNameChanged(String value) {
    username = value;
  }

  onUsernameChanged(String value) {
    username = value;
  }

  onPasswordChanged(String value) {
    password = value;
  }

  onSubmit() async {
    loading = true;
    update(['submitButton']);
    Map<String, dynamic> params = {
      "name": name,
      "username": username,
      "password": password,
    };

    Either<Failure, bool> res = await _registerUseCase.call(params);
    res.fold((l) {
      Get.snackbar('Error', 'Unexpected error');
    }, (user) {
      if (user) {
        Get.toNamed(HomePage.routeName);
        _clean();
      } else {
        Get.snackbar('Error', 'User not created');
      }
    });
    loading = false;
    update(['submitButton']);
  }

  _clean() {
    name = "";
    username = "";
    password = "";
  }
}

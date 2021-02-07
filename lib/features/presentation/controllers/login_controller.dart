import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_app/core/errors/failures.dart';
import 'package:test_app/core/usecases/use_case.dart';
import 'package:test_app/features/domain/entities/user_entity.dart';
import 'package:test_app/features/domain/usecases/get_token_usecase.dart';
import 'package:test_app/features/domain/usecases/login_usecase.dart';
import 'package:meta/meta.dart' show required;
import 'package:test_app/features/presentation/home/home_page.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  final GetTokenUseCase _getTokenUseCase;

  LoginController({
    @required LoginUseCase loginUseCase,
    @required GetTokenUseCase getTokenUseCase,
  })  : assert(loginUseCase != null),
        assert(getTokenUseCase != null),
        _getTokenUseCase = getTokenUseCase,
        _loginUseCase = loginUseCase;

  String username = "";
  String password = "";
  bool loading = false;

  onInit() async {
    Either<Failure, String> token = await _getTokenUseCase.call(NoParams());
    token.fold((l) {
      Get.snackbar('Error', 'Unexpected error');
    }, (token) {
      if (token != null && !token.isBlank) {
        Get.toNamed(HomePage.routeName);
      }
    });
    super.onInit();
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
      "username": username,
      "password": password,
    };

    Either<Failure, UserEntity> res = await _loginUseCase.call(params);
    res.fold((l) {
      Get.snackbar('Error', 'Unexpected error');
    }, (user) {
      if (user != null) {
        Get.toNamed(HomePage.routeName);
        _clean();
      } else {
        Get.snackbar('Error', 'User not found');
      }
    });
    loading = false;
    update(['submitButton']);
  }

  _clean() {
    username = "";
    password = "";
  }
}

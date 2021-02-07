import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/features/presentation/auth/register_page.dart';
import 'package:test_app/features/presentation/controllers/login_controller.dart';
import 'package:test_app/injection_container.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = "login.page";
  final LoginController loginController = sl<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: GetBuilder<LoginController>(
            init: loginController,
            builder: (_gcontroller) {
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: GetBuilder<LoginController>(
                            id: 'usernameInput',
                            builder: (_controller) {
                              return TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                ),
                                onChanged: (value) =>
                                    _controller.onUsernameChanged(value),
                              );
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: GetBuilder<LoginController>(
                            id: 'password',
                            builder: (_controller) {
                              return TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                  ),
                                  onChanged: (value) =>
                                      _controller.onPasswordChanged(value));
                            }),
                      ),
                      FlatButton(
                        onPressed: () {
                          Get.toNamed(RegisterPage.routeName);
                        },
                        textColor: Colors.blue,
                        child: Text('Register'),
                      ),
                      GetBuilder<LoginController>(
                          id: 'submitButton',
                          builder: (_controller) {
                            if (_controller.loading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Container(
                                height: 50,
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  child: Text('Login'),
                                  onPressed: () {
                                    _controller.onSubmit();
                                  },
                                ));
                          }),
                    ],
                  ));
            }));
  }
}

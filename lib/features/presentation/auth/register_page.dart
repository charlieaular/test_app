import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/features/presentation/controllers/register_controller.dart';
import 'package:test_app/injection_container.dart';

class RegisterPage extends StatelessWidget {
  static final String routeName = "register.page";
  final RegisterController registerController = sl<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Page'),
        ),
        body: GetBuilder<RegisterController>(
            init: registerController,
            builder: (_gcontroller) {
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: GetBuilder<RegisterController>(
                            id: 'nameInput',
                            builder: (_controller) {
                              return TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Name',
                                ),
                                onChanged: (value) =>
                                    _controller.onNameChanged(value),
                              );
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: GetBuilder<RegisterController>(
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
                        padding: EdgeInsets.all(10),
                        child: GetBuilder<RegisterController>(
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
                      GetBuilder<RegisterController>(
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
                                  child: Text('Register'),
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

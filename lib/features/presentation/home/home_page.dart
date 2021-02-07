import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/features/domain/entities/restaurant_entity.dart';
import 'package:test_app/features/presentation/auth/login_page.dart';
import 'package:test_app/features/presentation/controllers/home_controller.dart';

import '../../../injection_container.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "home.page";
  final HomeController homeController = sl<HomeController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed(LoginPage.routeName);
        return true;
      },
      child: GetBuilder<HomeController>(
          init: homeController,
          builder: (_gcontroller) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Home Page"),
              ),
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: GetBuilder<HomeController>(
                      id: 'textInput',
                      builder: (_controller) {
                        return TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Search',
                          ),
                          onChanged: (value) => _controller.onTextChange(value),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 150,
                    child: GetBuilder<HomeController>(
                        id: 'listRestaurants',
                        builder: (_controller) {
                          if (_controller.loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                            itemCount: _controller.listRestaurants.length,
                            itemBuilder: (context, index) {
                              RestaurantEntity current =
                                  _controller.listRestaurants[index];
                              return ListTile(
                                title: Text(current.title),
                              );
                            },
                          );
                        }),
                  )
                ],
              ),
            );
          }),
    );
  }
}

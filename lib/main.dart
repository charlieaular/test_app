import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_app/features/presentation/auth/login_page.dart';

import 'features/presentation/auth/register_page.dart';
import 'features/presentation/home/home_page.dart';
import 'injection_container.dart' as di;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Restaurant",
      initialRoute: LoginPage.routeName,
      getPages: [
        GetPage(name: LoginPage.routeName, page: () => LoginPage()),
        GetPage(name: RegisterPage.routeName, page: () => RegisterPage()),
        GetPage(name: HomePage.routeName, page: () => HomePage()),
      ],
    );
  }
}

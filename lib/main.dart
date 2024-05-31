import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/controllers/auth.dart';
import 'commun/utils/naviation.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: authController.isLogedIn ? '/Movies' : '/Auth',
        navigatorKey: CustomNavigation.rootNavigatorKey,
        routes: CustomNavigation.routes
      ),
    );
  }
}

// m_ouchene@estin.dz
// 123mohamed
// S2G9uz8j
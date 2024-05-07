import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

import 'commun/utils/naviation.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isLogedIn;
  @override
  void initState() {
    final storage = GetStorage();
    final jwt = storage.read('jwt');
    if (jwt == null) {
      isLogedIn = false;
    } else {
      isLogedIn = true;
    }
    setState(() {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: !isLogedIn ? '/Auth' : '/Movies',
        navigatorKey: CustomNavigation.rootNavigatorKey,
        routes: CustomNavigation.routes
      ),
    );
  }
}

// m_ouchene@estin.dz
// 123mohamed
// S2G9uz8j
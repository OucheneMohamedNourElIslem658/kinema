import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/features/auth/screens/birth_day.dart';
import 'package:kinema/features/my_reservations/screens/my_reservations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyReservations(),
    );
  }
}
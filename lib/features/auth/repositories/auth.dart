// ignore_for_file: avoid_print, use_build_context_synchronously
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http ;
import 'package:kinema/commun/utils/custom_snack_bar.dart';

class AuthRepository {
  final _url = 'http://10.0.2.2:8000/cinephile/';

  Future<void> registerUser(
    BuildContext context,
    {
      required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required String address,
      required String dateOfBirth
    }
  ) async {
      final user1 = {
        "Full_Name": name,
        "username": name.replaceAll(' ', ''),
        "email": email,
        "Phone_Number": phoneNumber,
        "Address": address,
        "Date_of_Birth": dateOfBirth,
        "password": password,
      };
      final response = await http.post(
        Uri.parse('${_url}register'), 
        body: user1
      );
      if (response.statusCode == 200) {
        GoRouter.of(context).go('/Auth');
        showSnackBar('Successfully signed up', context);
        showSnackBar('Sign In to engage more with us!', context);
      } else {
        showSnackBar(response.body , context);
      }
  }

  Future<void> loginUser(
    BuildContext context,
    {
      required String email,
      required String password,
    }
  ) async {
      // Map<String, dynamic> body = user.toJson();
      final user1 = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse('$_url/login'), 
        body: user1
      );
      if (response.statusCode == 200) {
        print("========================");
        print(response.body);
        print("========================");
        showSnackBar('Welcome!', context);
      } else {
        print(response.body);
      }
  }
}
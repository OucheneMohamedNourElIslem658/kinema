import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late TextEditingController emailController,passwordController,nameController;
  late GlobalKey<FormState> emailFormKey,passwordFormKey,nameFormKey,loginFormKey;

  @override
  void onInit() {
    emailFormKey = GlobalKey<FormState>();
    passwordFormKey = GlobalKey<FormState>();
    nameFormKey = GlobalKey<FormState>();
    loginFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.onInit();
  }

  String? emailValidation(){
    final isValidated =  GetUtils.isEmail(
      emailController.text
    );
    if (!isValidated) {
      return 'Invalid email address';
    }
    return null;
  }

  String? nameValidation() {
    final name = nameController.text.trim();
    if (name.isEmpty) {
      return 'Name is required.';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {
      return 'Invalid characters in the name. Only alphabetic characters and spaces are allowed.';
    }
    return null;
  }

  String? passwordValidation() {
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$'
    );
    final isValidated = passwordRegex.hasMatch(passwordController.text.trim());
    if (!isValidated) {
      return 'Password must contain at least one lowercase letter, one uppercase letter, and one digit.';
    }
    return null;
  }


  bool validateEmail(){
    return emailFormKey.currentState!.validate();
  }

  bool validateName(){
    return nameFormKey.currentState!.validate();
  }

  bool validatePassword(){
    return passwordFormKey.currentState!.validate();
  }

  bool validateLoginForm(){
    return loginFormKey.currentState!.validate();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}

//ABCabc123@
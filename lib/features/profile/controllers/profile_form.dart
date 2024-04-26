import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileFormController extends GetxController {
  late TextEditingController nameController,emailController,phoneController,dateOfBirthController;
  late GlobalKey<FormState> formKey;
  bool enableForm = false;

  void initialiseForm(){
    nameController = TextEditingController(text: 'Lamia Bakli');
    emailController = TextEditingController(text: 'lamiachikoura@gmail.com');
    dateOfBirthController = TextEditingController(text: '01/05/2004');
    phoneController = TextEditingController(text: '+213551307909');
    formKey = GlobalKey<FormState>();
  }

  @override
  void onInit() {
    initialiseForm();
    super.onInit();
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

  String? phoneNumberValidation() {
    final phoneNumber = phoneController.text.trim();
    final isPhoneValidated = RegExp(r'^\+[1-9]\d{1,14}$').hasMatch(phoneNumber);
    if (isPhoneValidated || phoneNumber == '') {
      return null;
    }
    return 'Invalid phone number';
  }

  String? emailValidation() {
    final isValidated = GetUtils.isEmail(emailController.text);
    final isEmailValidated = isValidated;
    update();
    if (isEmailValidated || emailController.text.trim() == '') {
      return null;
    }
    return 'Invalid email';
  }

  DateTime formatDateOfBirth(){
    final date = dateOfBirthController.text.split('/');
    return DateTime(int.parse(date[2]),int.parse(date[1]),int.parse(date[0]));
  }

  String formateDateToString(DateTime date){
    return '${date.day}/${date.month}/${date.year}';
  }

  void changeDateOfBirth(DateTime date){
    dateOfBirthController.text = formateDateToString(date);
    update();
  }

  void editForm(){
    enableForm = true;
    update();
  }

  bool validateForm(){
    final isValid = formKey.currentState!.validate();
    if(isValid){
      formKey.currentState!.save();
      enableForm = false;
      update();
      return true;
    }
    return false;
  }

  void cancelEdit(){
    initialiseForm();
    enableForm = false;
    update();
  }
}
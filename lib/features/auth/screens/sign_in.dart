import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/auth.dart';
import '/features/auth/widgets/background.dart';
import '/features/auth/widgets/custom_elevated_button.dart';
import '/features/auth/widgets/vertical_scroll_behaviour.dart';
import '../../../commun/constents/text_styles.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Scaffold(
      body: Background(
        child: SafeArea(
          child: VerticalScrollBehaviour(
            child: Form(
              key: authController.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: (){},
                    child:  SvgPicture.asset('assets/icons/back_arrow.svg'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Email address or username',
                    style: TextStyles.style4,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: authController.emailController,
                    validator: (p0) => authController.emailValidation(),
                  ),
                  const SizedBox(height: 10),
                  const Spacer(),
                  Text(
                    'Password',
                    style: TextStyles.style4,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: authController.passwordController,
                    isPassword: true,
                    validator: (p0) => authController.passwordValidation(),
                  ),
                  const SizedBox(height: 10),
                  const Spacer(),
                  Center(
                    child: CustomElevatedButton(
                      onPressed: () {
                        if(authController.validateLoginForm()){
                        }
                      }, 
                      width: null,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      child: Text(
                        'Sign in', 
                        style: TextStyles.style3
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: CustomTextButton(
                      onPressed: (){}, 
                      text: 'You Forgot Your Password?'
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
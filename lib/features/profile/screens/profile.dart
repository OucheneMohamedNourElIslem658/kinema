import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '/features/profile/controllers/profile_form.dart';
import '../widgets/edit_profile_form.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/commun/widgets/vertical_scroll_behaviour.dart';
import '/features/reservations/widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.put(ProfileFormController());

    return GetBuilder<ProfileFormController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: CustomColors.black2,
          appBar: customAppBar(
            title: 'Profile',
            showTitle: true,
            actions: [
              formController.enableForm
              ? IconButton(
                onPressed: () => formController.cancelEdit(), 
                icon: SvgPicture.asset(
                  'assets/icons/delete.svg',
                  // ignore: deprecated_member_use
                  color: CustomColors.white,
                )
              )
              : const SizedBox()
            ]
          ),
        
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: VerticalScrollBehaviour(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 72,
                      width: 72,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar3.png'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      formController.nameController.text,
                      style: TextStyles.style34,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      formController.emailController.text,
                      style: TextStyles.style35,
                    ),
                    const SizedBox(height: 30),
                    const EditProfileFrom(),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
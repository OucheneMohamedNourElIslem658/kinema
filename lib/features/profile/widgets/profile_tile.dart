import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kinema/features/auth/controllers/auth.dart';
import 'package:kinema/models/user.dart';

import '/commun/utils/navigation_methods.dart';
import '/features/profile/screens/profile.dart';
import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) { 
    final authController = Get.put(AuthController());
    return FutureBuilder<UserModel?>(
      future: authController.getUserDetail(context),
      builder: (context, snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: CustomColors.greyBorder2
            )
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 54,
                width: 54,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar3.png"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    snapshot.data == null 
                      ? const CustomTextLoader(height: 15, width: 100)
                      : Text(
                        snapshot.data!.fullName!,
                        style: TextStyles.style34,
                      ),
                    const SizedBox(height: 3),
                    snapshot.data == null
                      ? const CustomTextLoader(height: 15, width: 150)
                      : Text(
                          snapshot.data!.email!,
                          style: TextStyles.style35,
                        ),
                  ],
                )
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => push(context, const ProfileScreen()),
                  // onPressed: () => getCurrentUser(),
                  icon: SvgPicture.asset('assets/icons/edit.svg'), 
                ),
              )
            ],
          ),
        );
      }
    );
  }
}

class CustomTextLoader extends StatelessWidget {
  const CustomTextLoader({
    super.key, 
    required this.height, 
    required this.width,
    this.borderRadius = 3
  });

  final double height,width,borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(borderRadius)
      ),
    ).animate(onComplete: (controller) => controller.repeat())
    .shimmer(
      duration: const Duration(seconds: 1)
    );
  }
}
import 'package:flutter/material.dart';

import '../widgets/avatars.dart';
import '/commun/utils/navigation_methods.dart';
import '/commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: 'Edit Avatar',
        onGoBack: () => pop(context)
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 108,
              width: 108,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar3.png"),
              ),
            ),
            SizedBox(height: 30),
            Avatars()
          ],
        ),
      ),
    );
  }
}
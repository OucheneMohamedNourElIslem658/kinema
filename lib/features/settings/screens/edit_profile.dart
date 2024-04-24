import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '/features/settings/controllers/settings.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(title: 'Edit Avatar'),
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

class Avatars extends StatelessWidget {
  const Avatars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsContoller = Get.put(SettingsController());

    return GetBuilder<SettingsController>(
      builder: (_) {
        return SizedBox(
          width: 260,
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            children: List.generate(
              settingsContoller.avatars.length, 
              (index) {
                final avatar = settingsContoller.avatars[index];
                final isSelected = avatar['isSelected'] as bool;
                final imagePath = avatar['imagePath'] as String;
                return Center(
                  child: GestureDetector(
                    onTap: () => settingsContoller.selectAvatar(index),
                    child: AvatarItem(
                      imagePath: imagePath,
                      isSelected: isSelected,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }
}

class AvatarItem extends StatelessWidget {
  const AvatarItem({
    super.key,
    required this.imagePath,
    this.isSelected = false,
  });

  final String imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: 122,
      width: 122,
      padding: isSelected
        ? const EdgeInsets.all(3)
        : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: isSelected
          ? Border.all(
            color: CustomColors.primaryRed, 
            width: 3.11
          )
          : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
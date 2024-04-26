import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CustomColors.greyBorder2
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'General',
              style: TextStyles.style37.copyWith(
                color: CustomColors.primaryBej
              ),
            ),
          ),
          Column(
            children: [
              SettingsItem(
                title: 'My Reservations', 
                iconPath: 'assets/icons/ticket3.svg', 
                onPressed: (){}
              ),
              devider(),
              SettingsItem(
                title: 'Change Password', 
                iconPath: 'assets/icons/lock.svg', 
                onPressed: (){}
              ),
              devider(),
              SettingsItem(
                title: 'Feedback', 
                iconPath: 'assets/icons/flag.svg', 
                onPressed: (){}
              ),
              devider(),
              SettingsItem(
                title: 'Log Out', 
                iconPath: 'assets/icons/logout.svg', 
                onPressed: (){}
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget devider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: const Divider(
        thickness: 0.1,
        color: CustomColors.greyText2,
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onPressed,
  });

  final String title, iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          decoration: const BoxDecoration(
            color: CustomColors.black4,
            shape: BoxShape.circle
          ),
          child: SvgPicture.asset(iconPath),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            title,
            style: TextStyles.style35,
          )
        ),
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset('assets/icons/arrow_forward_ios2.svg'),
        ),
      ],
    );
  }
}
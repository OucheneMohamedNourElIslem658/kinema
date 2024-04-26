import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CustomColors.greyBorder2
        )
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    'Lam.exe Failed',
                    style: TextStyles.style34,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'lamiachikoura@gmail.com',
                    style: TextStyles.style35,
                  ),
                ],
              )
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => push(context, const ProfileScreen()),
                icon: SvgPicture.asset('assets/icons/edit.svg'), 
              ),
            )
          ],
        ),
      ),
    );
  }
}
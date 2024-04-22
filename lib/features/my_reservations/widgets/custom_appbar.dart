import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../auth/widgets/custom_icon_button.dart';

AppBar customAppBar() {
  return AppBar(
    backgroundColor: CustomColors.transparent,
    flexibleSpace: Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          CustomIconButton(
            child: SvgPicture.asset('assets/icons/arrow_back_ios.svg'), 
            onPressed: (){}
          ),
          const SizedBox(width: 0),
          Text(
            'My Reservations',
            style: TextStyles.style2,
          )
        ],
      ),
    ),
  );
}
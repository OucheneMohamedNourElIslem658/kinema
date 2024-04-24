import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_icon_button.dart';

AppBar customAppBar({
  String? title,
  bool centertitle = false,
  bool showTitle = false,
  bool showBackButton = true,
  VoidCallback? onGoBack,
  double? space
}) {
  return AppBar(
    backgroundColor: CustomColors.transparent,
    flexibleSpace: Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          showBackButton
          ? CustomIconButton(
            onPressed: onGoBack ?? (){},
            child: SvgPicture.asset('assets/icons/arrow_back_ios.svg')
          )
          : const SizedBox(),
          centertitle ? const Spacer(flex: 7) : const SizedBox(),
          SizedBox(width: space),
          showTitle
          ? Text(
            title ?? 'My Reservations',
            style: TextStyles.style2.copyWith(
              color: CustomColors.white
            ),
          )
          : const SizedBox(),
          centertitle 
            ? const Spacer(flex: 13) 
            : const SizedBox(),
        ],
      ),
    ),
  );
}
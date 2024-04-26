import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        SvgPicture.asset('assets/images/empty_card.svg'),
        const SizedBox(height: 20),
        Text(
          'Your card is empty, check what we have in stock!',
          style: TextStyles.style7.copyWith(
            color: CustomColors.greyText3
          )
        ),
        const Spacer(flex: 7)
      ],
    );
  }
}
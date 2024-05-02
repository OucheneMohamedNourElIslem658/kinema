import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_network_image.dart';
import '../../../commun/widgets/more_button.dart';

class Event extends StatelessWidget {
  const Event({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Upcoming Events',
            style: TextStyles.style14.copyWith(
              color: CustomColors.white
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.maxFinite,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8)
          ),
          child: const CustomNetworkImage(
            backgroundImageURL: 'https://s3-alpha-sig.figma.com/img/3dc4/15c4/719f297ab9eda53b6f036328ac86c18c?Expires=1715558400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=iFwKUpnGiF8a70JcGXWSxdYptRdPQrHI~SQYEqRuUInKA6RZhwej6l-MBUrib~LLQZ2xJt3KUWkaALpPPbvxmpADwCwH5hbg1ZKsYdAf0iYcnjWPv~rndMoSwhuaD2plvnYiUKbRo3QG7T~rQkKyVdDiZMAF3ZvXoB5xJfT1sB1YN14Fe5aBf53KLlUYjxLR8eaGMOkHONAEmvEJkFgZYLrmt1hp2mNxEj2uk7Ts3nRoYMZXfOlG4XzIJc-MOprukR~zcxt1MrKLxsMGS-tlc5t2KjJ2DCRlgw74-EJHH-o69phx0N7BWun~vn4dZyqxWAcyjIpg7wKjW0qbuyrzNw__',
            shimmerBorderRadius: 8,
            isJustTopRadius: true,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Mar',
                      style: TextStyles.style25.copyWith(
                        color: CustomColors.greyText2
                      )
                    ),
                    Text(
                      '11',
                      style: TextStyles.style39,
                    )
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ramadan Holly Month',
                        style: TextStyles.style33.copyWith(
                          color: CustomColors.primaryBej
                        ),
                      ),
                      Text(
                        'Join us this Ramadan as Kinema pays tribute to Islamic civilization with special screenings...',
                        style: TextStyles.style25.copyWith(
                          color: CustomColors.greyText2
                        )
                      )
                    ],
                  )
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: MoreButton(
            onSeeMore: (){},
            text: 'More Events',
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:kinema/models/event.dart';

import '../constents/colors.dart';
import '../constents/text_styles.dart';
import 'custom_network_image.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.event
  });

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8)
          ),
          child: CustomNetworkImage(
            backgroundImageURL: event.url,
            shimmerBorderRadius: 8,
            isJustTopRadius: true,
            fit: BoxFit.cover,
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
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      event.month,
                      style: TextStyles.style25.copyWith(
                        color: CustomColors.greyText2
                      )
                    ),
                    Text(
                      event.day.toString(),
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
                        event.title,
                        style: TextStyles.style33.copyWith(
                          color: CustomColors.primaryBej
                        ),
                      ),
                      Text(
                        event.description,
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
      ],
    );
  }
}
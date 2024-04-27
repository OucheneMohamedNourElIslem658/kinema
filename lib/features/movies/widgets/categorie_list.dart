import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/utils/navigation_methods.dart';
import '../../../commun/widgets/custom_network_image.dart';
import '../../../commun/widgets/imdb_rate.dart';
import '../screens/movie_selected.dart';

class CategorieList extends StatelessWidget {
  const CategorieList({
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
            'Diffusing Today',
            style: TextStyles.style14.copyWith(
              color: CustomColors.white
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 20),
              Row(
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    onTap: () =>  push(context, const MovieScreen()),
                    child: Stack(
                      children: [
                        Container(
                          height: 184,
                          width: 128,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const CustomNetworkImage(
                            backgroundImageURL: 'https://musicart.xboxlive.com/7/14815100-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080',
                            shimmerBorderRadius: 12,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: IMDBRate(
                              rate: 7.5,
                              fontSize: 7,
                              paddingHor: 12,
                              paddingVer: 6,
                              borderRadius: 6,
                          ),
                        ),
                      ]
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
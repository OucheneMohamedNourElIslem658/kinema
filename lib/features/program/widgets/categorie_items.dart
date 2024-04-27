import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kinema/commun/widgets/custom_network_image.dart';

import '/commun/utils/navigation_methods.dart';
import '/features/movies/screens/movie_selected.dart';
import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/imdb_rate.dart';

class CategoriItems extends StatelessWidget {
  const CategoriItems({
    super.key,
    required this.name,
    required this.movies
  });

  final String name;
  final List movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            name,
            style: TextStyles.style14.copyWith(
              color: CustomColors.primaryBej
            ),
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              6, 
              (index) => const Row(
                children: [
                  SizedBox(width: 20),
                  MovieItem(
                    imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaKZoi9-IkxLYjV6GB6tnoyrmoR1eySjfbm8NKkTb5Ig&s',
                    name: 'The Batman',
                    type: 'Action',
                    rate: 7.5,
                    time: '10AM-01PM',
                  ),
                ],
              )
            ),
          ),
        )
      ],
    );
  }
}

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key, 
    required this.imageURL, 
    required this.name, 
    required this.type, 
    required this.rate,
    required this.time
  });

  final String imageURL,name,type,time;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => push(context,const MovieScreen()),
      child: SizedBox(
        width: 163,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CustomNetworkImage(
                    backgroundImageURL: imageURL,
                    shimmerBorderRadius: 8,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: CustomColors.black7,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/clock.svg'),
                        const SizedBox(width: 5),
                        Text(
                          time,
                          style: TextStyles.style29,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyles.style6.copyWith(
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                      const IMDBRate(
                        rate: 7.5,
                        fontSize: 7,
                        borderRadius: 6,
                        paddingHor: 8,
                        paddingVer: 5,
                      )
                    ],
                  ),
                ),
                Text(
                  type,
                  style: TextStyles.style28
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
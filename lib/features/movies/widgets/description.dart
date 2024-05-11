import 'package:flutter/material.dart';
import 'package:kinema/commun/utils/date_formats.dart';
import 'package:kinema/models/movie.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/imdb_rate.dart';
import 'cast_list.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.movie
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.name,
                          style: TextStyles.style13.copyWith(
                            color: CustomColors.white
                          ),
                        ),
                        Text(
                          movie.type,
                          style: TextStyles.style17,
                        ),
                      ],
                    )
                  ),
                  const IMDBRate(rate: 7.5)
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              StatisticItem(title: 'Time',count: '${movie.time} Min'),
              const SizedBox(width: 15),
              StatisticItem(title: 'Views',count: '${movie.views / 1000000} M'),
              const SizedBox(width: 15),
              const StatisticItem(title: 'P-G',count: '13+'),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Text(
            'Cast',
            style: TextStyles.style14.copyWith(
              color: CustomColors.white
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CastList(
            cast: movie.cast,
          ),
        ),
        DiffusingTimes(
          movie: movie,
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: DescriptionText(),
        )
      ],
    );
  }
}

class DiffusingTimes extends StatelessWidget {
  const DiffusingTimes({
    super.key,
    required this.movie
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          movie.showTime.length, 
          (index) {
            final time = movie.showTime[index];
            return StatisticItem(
              title: '', 
              count: '',
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formatDateTime(time),
                  style: TextStyles.style13,
                ),
                Text(
                  '\n${formatHour(time)}-${addMinutes(time,movie.time)}',
                  style: TextStyles.style12
                    .copyWith(color: CustomColors.white, height: 0.4)
                )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Description\n',
            style: TextStyles.style3
          ),
          TextSpan(
            text: 'After the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of reter the murder of his father, a young lion prince flees his kiter the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of reter the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of reter the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of reter the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of reter the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of rengdom only to learn the true meaning of reter the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.In Africa, the lion cub Simba is the pride and joy of his parents King Mufasa and Queen Sarabi. Mufasa prepares Simba to be the next king of the jungle. However, the naive Simba believes in his envious uncle Scar that wants to kill Mufasa and Simba to become the next king. He lures Simba and his friend Nala to go to a forbidden place and they are attacked by hyenas but they are rescued by Mufasa. Then Scar plots another scheme to kill Mufasa and Simba but the cub escapes alive and leaves the kingdom believing he was responsible for the death of his father. ',
            style: TextStyles.style11.copyWith(
              color: CustomColors.greyText1
            )
          )
        ]
      )
    );
  }
}
class StatisticItem extends StatelessWidget {
  const StatisticItem({
    super.key,
    required this.title,
    required this.count,
    this.child,
    this.padding
  });

  final String title,count;
  final Widget? child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.white.withOpacity(0.1)
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: child ?? RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyles.style18
            ),
            TextSpan(
              text: '\n$count',
              style: TextStyles.style19
            )
          ]
        )
      ),
    );
  }
}
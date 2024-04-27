import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_video_player.dart';

class TrailersList extends StatelessWidget {
  const TrailersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Popular Trailers',
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
                  3, 
                  (index) => const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: CustomVideoPlayer(
                      videoURL: 'https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/Rebel%20Moon%20-%20Part%20Two_%20The%20Scargiver%20_%20Official%20Teaser%20_%20Netflix.mp4?alt=media&token=feebfa58-56b5-489c-ac10-ed575aa8a554',
                      width: 280,
                      borderRadius: 12,
                      title: 'Spiderman: Into The Spiderverse',
                      showTitle: true,
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
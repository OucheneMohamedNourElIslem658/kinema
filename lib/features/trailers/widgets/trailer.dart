import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '/commun/utils/navigation_methods.dart';
import '/features/movies/screens/movie_selected.dart';
import '/features/reservations/screens/seat_choice.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/custom_elevated_button.dart';
import '../../../commun/widgets/custom_video_player.dart';
import '../../../commun/widgets/devider.dart';
import '../../../commun/widgets/horizotal_scroll_behaviour.dart';
import '../../auth/widgets/custom_text_button.dart';

class Trailer extends StatelessWidget {
  const Trailer({
    super.key,
    required this.title,
    required this.path,
    required this.time,
    required this.type,
    required this.controller
  });

  final String title;
  final String path;
  final String time;
  final String type;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.black5,
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyles.style24,
            ),
          ),
          CustomVideoPlayer(
            videoURL: path,
            controller: controller,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: HorizontalScrollBehaviour(
              child: Info(
                time: time, 
                type: type,
                onSeeMore: () => push(context, const MovieScreen()),
              ),
            ),
          ),
          Center(
            child: BuyTicketButton(
              onPressed: () => push(context, const SeatChoiceScreen()),
            ),
          )
        ],
      ),
    );
  }
}

class BuyTicketButton extends StatelessWidget {
  const BuyTicketButton({
    super.key, 
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed, 
      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/ticket2.svg'),
          const SizedBox(width: 10),
          Text(
            'Buy Ticket',
            style: TextStyles.style6,
          )
        ],
      )
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.time,
    required this.type,
    required this.onSeeMore
  });

  final String time;
  final String type;
  final VoidCallback onSeeMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/calendar.svg'),
        const SizedBox(width: 5),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Diffusing on: ',
                style: TextStyles.style25
              ),
              TextSpan(
                text: time,
                style: TextStyles.style25.copyWith(
                  color: CustomColors.primaryBej
                )
              ),
            ]
          )
        ),
        const SizedBox(width: 10),
        const Devider(
          color: CustomColors.greyText1
        ),
        const SizedBox(width: 10),
        SvgPicture.asset('assets/icons/film.svg'),
        const SizedBox(width: 5),
        Text(
          type,
          style: TextStyles.style25
        ),
        const Spacer(),
        const SizedBox(width: 5),
        CustomTextButton(
          onPressed: onSeeMore, 
          child: Row(
            children: [
              Text(
                'See More',
                style: TextStyles.style26,
              ),
              const SizedBox(width: 5),
              SvgPicture.asset('assets/icons/arrow_forward_ios.svg')
            ],
          ),
        )
      ],
    );
  }
}
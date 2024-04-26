import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kinema/commun/constents/colors.dart';
import 'package:kinema/commun/constents/text_styles.dart';
import 'package:kinema/features/movies/widgets/screen_with_shadow.dart';

import '../../../commun/widgets/custom_video_player.dart';
import '../../../commun/widgets/imdb_rate.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenWithShadow(
        backgroundImageURL: 'https://musicart.xboxlive.com/7/14815100-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080', 
        showAppBar: false,
        showPayButton: false,
        shadowPadding: -0.15,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 350),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Description(),
                    GestureDetector(
                      onTap: () => GoRouter.of(context).go('/Movie'),
                      child: SvgPicture.asset(
                        'assets/icons/play.svg',
                        height: 42,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const CategorieList(),
              const SizedBox(height: 15),
              const TrailersList(),
              const SizedBox(height: 70),
            ],
          ),
        ), 
      ),
    );
  }
}

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
                      videoURL: 'assets/videos/flutter.mp4',
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
                    onTap: () => GoRouter.of(context).go('/Movie'),
                    child: Container(
                      height: 184,
                      width: 128,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: NetworkImage('https://musicart.xboxlive.com/7/14815100-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080'),
                          fit: BoxFit.cover
                        )
                      ),
                      child: const IMDBRate(
                        rate: 7.5,
                        fontSize: 7,
                        paddingHor: 12,
                        paddingVer: 6,
                        borderRadius: 6,
                      ),
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

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "COCO",
              style: TextStyles.style13,
            ),
            const SizedBox(width: 15),
            const IMDBRate(
              rate: 7.5,
            )
          ],
        ),
        Text(
          'Animation, Musical',
          style: TextStyles.style17,
        )
      ],
    );
  }
}
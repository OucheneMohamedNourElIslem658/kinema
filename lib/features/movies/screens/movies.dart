import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/contact_us.dart';
import '/commun/widgets/custom_network_image.dart';

import '../../../commun/constents/movies_list.dart';
import '../widgets/event.dart';
import '/features/movies/widgets/discription_tile.dart';
import '../widgets/categorie_list.dart';
import '../widgets/trailers_list.dart';
import '/commun/utils/navigation_methods.dart';
import '/features/movies/screens/movie_selected.dart';
import '/features/movies/widgets/screen_with_shadow.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ScreenWithShadow(
        backgroundImageURL: program[1].picUrl,
        showAppBar: false,
        showPayButton: false,
        shadowPadding: -0.5,
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
                    const DescriptionTile(),
                    GestureDetector(
                      onTap: () => push(
                          context,
                          MovieScreen(
                            movie: program[1],
                          )),
                      child: SvgPicture.asset(
                        'assets/icons/play.svg',
                        height: 42,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              CategorieList(movies: program),
              const SizedBox(height: 15),
              const TrailersList(),
              const SizedBox(height: 15),
              const SizedBox(
                height: 230,
                width: double.maxFinite,
                child: CustomNetworkImage(
                    backgroundImageURL:
                        'https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/snacks.png?alt=media&token=4126c18c-125c-4135-8951-55d1fc4c7f78'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Event(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ContactUs(),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../commun/constents/movies_list.dart';
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
    // final programController = Get.put(ProgramController());

    return Scaffold(
      body: ScreenWithShadow(
        backgroundImageURL: program[1].picUrl, 
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
                    const DescriptionTile(),
                    GestureDetector(
                      onTap: () => push(context, MovieScreen(
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
              const SizedBox(height: 70),
            ],
          ),
        ), 
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/models/movie.dart';
import 'package:video_player/video_player.dart';

import '../widgets/trailer.dart';
import '/commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '/features/trailers/controllers/trailers.dart';

class TrailersScreen extends StatelessWidget {
  const TrailersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trailersController = Get.put(TrailersController());

    return Scaffold(
      appBar: customAppBar(
        showTitle: true,
        title: 'Trailers',
        showBackButton: false
      ),
      backgroundColor: CustomColors.black2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<TrailersController>(
              builder: (_) {
                return Column(
                  children: List.generate(
                    trailersController.trailers.length, 
                    (index) {
                      final trailer = trailersController.trailers[index];
                      final movie = trailer['movie'] as Movie;
                      final controller = trailer['controller'] as VideoPlayerController?;
      
                      if (controller == null) {
                        return const SizedBox();
                      }
                          
                      return Trailer(
                        movie: movie,
                        controller: controller,
                      );
                    },
                  )
                );
              }
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
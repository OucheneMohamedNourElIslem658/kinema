import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Column(
              children: List.generate(
                trailersController.tailers.length, 
                (index) {
                  final trailer = trailersController.tailers[index];
                  final title = trailer['title'] as String;
                  final time = trailer['time'] as String;
                  final type = trailer['type'] as String;
                  final path = trailer['path'] as String;

                  return Trailer(
                    title: title, 
                    path: path, 
                    time: time, 
                    type: type
                  );
                },
              )
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
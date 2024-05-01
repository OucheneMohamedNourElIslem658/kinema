import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commun/controllers/program.dart';
import '../../../commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../widgets/categorie_items.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final programController = Get.put(ProgramController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showBackButton: false,
        showTitle: true,
        title: 'This Week’s Program',
        space: 20,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CategoriItems(
              name: 'Action Movies',
              movies: programController.getActionMovies(),
            ),
            const SizedBox(height: 20),
            CategoriItems(
              name: 'Adventure Movies',
              movies: programController.getAdventureMovies(),
            ),
            const SizedBox(height: 20),
            CategoriItems(
              name: 'Crime Movies', 
              movies: programController.getCrimeMovies()
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
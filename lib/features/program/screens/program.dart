import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../widgets/categorie_items.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showBackButton: false,
        showTitle: true,
        title: 'This Week’s Program',
        space: 20
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CategoriItems(
              name: 'Diffusing Today',
              movies: [],
            ),
            SizedBox(height: 20),
            CategoriItems(
              name: 'Diffusing Today',
              movies: [],
            ),
            SizedBox(height: 20),
            CategoriItems(
              name: 'Wednesday, April 24th',
              movies: [],
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
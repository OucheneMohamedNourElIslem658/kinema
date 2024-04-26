import 'package:flutter/material.dart';

import '/commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../widgets/bag_button.dart';
import '../widgets/market_list.dart';

class FidelityMarketScreen extends StatelessWidget {
  const FidelityMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: 'Fidelty Market',
        showTitle: true,
        showBackButton: false,
        actions: [const BagButton()]
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            MarketList(
              categorieName: 'Caps',
              items: [],
            ),
            SizedBox(height: 10),
            MarketList(
              categorieName: 'Shirts',
              items: [],
            ),
            SizedBox(height: 10),
            MarketList(
              categorieName: 'Cups',
              items: [],
            ),
            SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}
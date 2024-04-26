import 'package:flutter/material.dart';

import '/commun/utils/navigation_methods.dart';
import '/commun/constents/colors.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../widgets/bag_button.dart';
import '../widgets/market_list.dart';

class FidelityMarketScreen extends StatelessWidget {
  const FidelityMarketScreen({
    super.key,
    this.showBackButton = true
  });

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: 'Fidelty Market',
        showTitle: true,
        showBackButton: showBackButton,
        onGoBack: () => pop(context),
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/card.dart';
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
    final cardController = Get.put(CardController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: 'Fidelty Market',
        showTitle: true,
        showBackButton: showBackButton,
        onGoBack: () => pop(context),
        actions: [
          GetBuilder<CardController>(
            builder: (_) {
              return BagButton(
                addRedDot: cardController.cardItems.isNotEmpty,
              );
            }
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            MarketList(
              categorieName: 'Caps',
              items: cardController
                .market
                .where((element) => element['categorie'] == 'caps')
                .toList(),
            ),
            const SizedBox(height: 10),
            MarketList(
              categorieName: 'Shirts',
              items: cardController.market
                  .where((element) => element['categorie'] == 'shirts')
                  .toList(),
            ),
            const SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}
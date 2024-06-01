import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kinema/commun/widgets/waiting_widget.dart';
import 'package:kinema/features/fidelity/controllers/fidelity.dart';

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
    final fidelityMarketController = Get.put(FidelityController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: 'Fidelty Market',
        showTitle: true,
        showBackButton: showBackButton,
        onGoBack: () => pop(context),
        actions: [
          GetBuilder<FidelityController>(
            builder: (_) {
              return BagButton(
                addRedDot: fidelityMarketController.cardItems.isNotEmpty,
              );
            }
          )
        ]
      ),
      body: GetBuilder<FidelityController>(
        builder: (_) {
          if (fidelityMarketController.items.isEmpty) {
            return const WaitingWidget();
          }
          return RefreshIndicator(
            onRefresh: () async {
              await fidelityMarketController.getItems();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  MarketList(
                    categorieName: 'Caps',
                    items: fidelityMarketController.items
                  ),
                  const SizedBox(height: 10),
                  MarketList(
                    categorieName: 'Shirts',
                    items: fidelityMarketController.items
                  ),
                  const SizedBox(height: 10),
                  MarketList(
                    categorieName: 'Shirts',
                    items: fidelityMarketController.items
                  ),
                  const SizedBox(height: 70)
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
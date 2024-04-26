import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/utils/navigation_methods.dart';
import 'package:kinema/features/fidelity/screens/invoice.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/commun/widgets/custom_elevated_button.dart';
import '/features/fidelity/controllers/show_hide_button.dart';
import '/features/reservations/widgets/custom_appbar.dart';

import '../widgets/card_items.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardContoller = Get.put(CardController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showTitle: true,
        title: 'My Cart',
        onGoBack: () => pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<CardController>(
          builder: (_) {
            return Stack(
              children: [
                CardItems(
                  cardController: cardContoller,
                ),
                cardContoller.isScrollingUp && cardContoller.cardItems.isNotEmpty
                ? Align(
                  alignment: const Alignment(0,0.6),
                  child: CustomElevatedButton(
                    onPressed: () => push(context, const InvoiceScreen()), 
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                    child: Text(
                      'Get Items',
                      style: TextStyles.style2,
                    )
                  ),
                )
                : const SizedBox()
              ],
            );
          }
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commun/constents/text_styles.dart';
import '../controllers/reservations_controller.dart';

class ReservationSummery extends StatelessWidget {
  const ReservationSummery({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationsController = Get.put(ReservationsController());

    return GetBuilder<ReservationsController>(
      builder: (_) {
        return Column(
          children: [
            PriceItem(
              title: 'Single seat price',
              price: reservationsController.singleSeatPrice,
            ),
            const SizedBox(height: 10),
            PriceItem(
              title: 'Total price',
              price: reservationsController.totalPrice,
            ),
          ],
        );
      }
    );
  }
}

class PriceItem extends StatelessWidget {
  const PriceItem({
    super.key,
    required this.price,
    required this.title
  });

  final double price;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyles.style22,
          ),
        ),
        Text(
          '${price}DA',
          style: TextStyles.style22,
        )
      ],
    );
  }
}
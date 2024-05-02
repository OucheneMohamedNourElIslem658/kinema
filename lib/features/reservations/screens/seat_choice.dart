import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/widgets/payment_button.dart';
import 'package:kinema/features/reservations/screens/ticket.dart';
import 'package:pay/pay.dart';

import '/commun/utils/navigation_methods.dart';
import '/commun/widgets/vertical_scroll_behaviour.dart';
import '../widgets/reservation_summery.dart';
import '/commun/constents/colors.dart';
import '../controllers/reservations.dart';
import '/features/reservations/widgets/custom_appbar.dart';
import '../widgets/seats.dart';
import '../widgets/screen.dart';
import '../widgets/selected_hole_time.dart';

class SeatChoiceScreen extends StatelessWidget {
  const SeatChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationController = Get.put(ReservationsController());
    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        title: 'AVATAR 2',
        centertitle: true,
        showTitle: true,
        onGoBack: () {
          pop(context);
          Get.delete<ReservationsController>();
        },
      ),
      body: VerticalScrollBehaviour(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: GetBuilder<ReservationsController>(
                builder: (_) {
                  return SelectedHoleTimes(
                    reservationController: reservationController
                  );
                }
              ),
            ),
            const SizedBox(height: 40),
            const Screen(),
            const SizedBox(height: 30),
            Column(
              children: [
                GetBuilder<ReservationsController>(
                  builder: (_) {
                    return Seats(
                      reservationController: reservationController
                    );
                  }
                ),
                const SizedBox(height: 30),
                const SeatsStatus()
              ],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ReservationSummery()
            ),
            const SizedBox(height: 20),
            const Spacer(),
            // CustomElevatedButton(
            //   onPressed: () => push(context, const TicketScreen()), 
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 60, vertical: 16
            //   ),
            //   child: Text(
            //     'Next',
            //     style: TextStyles.style2
            //   ),
            // ),
            PaymentButton(
              paymentItems: [
                PaymentItem(
                  label: 'Total',
                  amount: reservationController.totalPrice.toString(),
                  status: PaymentItemStatus.final_price,
                )
              ],
              onPaymentResult: (result) {
                if (kDebugMode) {
                  print(result);
                }
                push(context, const TicketScreen());
              },
            ),
            const Spacer(),
            const SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}
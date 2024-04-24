import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commun/constents/colors.dart';
import '../widgets/reservation_card.dart';
import '../controllers/reservations_controller.dart';
import '../widgets/custom_appbar.dart';

class MyReservations extends StatelessWidget {
  const MyReservations({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationsController = Get.put(ReservationsController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(),

      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
        child: ListView.builder(
          itemCount: reservationsController.reservations.length,
          itemBuilder:(context, index) {
            final reservation = reservationsController.reservations[index];
            final movie = reservation['movie'] as String;
            final date = reservation['date'] as String;
            final type = reservation['type'] as String;
            final startsAfter = reservation['startsAfter'] as String;
            final rate = reservation['rate'] as double;
            final imageURL = reservation['imageURL'] as String;
            return ReservationCard(
              imageURL: imageURL, 
              movie: movie, 
              date: date, 
              type: type, 
              startsAfter: startsAfter, 
              rate: rate
            );
          },
        ),
      )
    );
  }
}
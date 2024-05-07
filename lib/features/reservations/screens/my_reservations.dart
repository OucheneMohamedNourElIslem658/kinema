import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/models/movie.dart';

import '/commun/utils/navigation_methods.dart';
import '/features/reservations/screens/ticket.dart';
import '../../../commun/constents/colors.dart';
import '../widgets/reservation_card.dart';
import '../controllers/reservations.dart';
import '../widgets/custom_appbar.dart';

class MyReservationsScreen extends StatelessWidget {
  const MyReservationsScreen({
    super.key,
    required this.movies
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final reservationsController = Get.put(ReservationsController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showTitle: true,
        onGoBack: () => pop(context),
      ),

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
            return GestureDetector(
              onTap: () => push(
                context,
                TicketScreen(
                  showCancel: false,
                  movie: movies[index],
                  seats: const ['G4', 'G3', 'G8', 'G9'],
                  range: '10 AM - 01 PM',
                )
              ),
              child: ReservationCard(
                imageURL: imageURL, 
                movie: movie, 
                date: date, 
                type: type, 
                startsAfter: startsAfter, 
                rate: rate
              ),
            );
          },
        ),
      )
    );
  }
}
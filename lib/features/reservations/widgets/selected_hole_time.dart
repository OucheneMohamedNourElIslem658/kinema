import 'package:flutter/material.dart';

import '../../../commun/constents/colors.dart';
import '../../../commun/constents/text_styles.dart';
import '../controllers/reservations_controller.dart';

class SelectedHoleTimes extends StatelessWidget {
  const SelectedHoleTimes({
    super.key,
    required this.reservationController,
  });

  final ReservationsController reservationController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 50,
        child: Row(
          children: List.generate(
            reservationController.holeReservationTimes.length, 
            (index) {
              final holeReservation = reservationController.holeReservationTimes[index];
              final day = holeReservation['day'] as String;
              final time = holeReservation['time'] as String;
              final isSelected = holeReservation['isSelected'] as bool;
              return Padding(
                padding: const EdgeInsets.only(right: 30),
                child: GestureDetector(
                  onTap: () => reservationController.selectHoleTime(index),
                  child: HoleReservationItem(isSelected: isSelected, day: day, time: time),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

class HoleReservationItem extends StatelessWidget {
  const HoleReservationItem({
    super.key,
    required this.isSelected,
    required this.day,
    required this.time,
  });

  final bool isSelected;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 200),
      style: const TextStyle(fontSize: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            style: isSelected ? TextStyles.style13 : TextStyles.style14,
            child: Text(day)
          ),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            style: isSelected ? TextStyles.style6.copyWith(
              color: CustomColors.white,
              height: 0.4
            ) : TextStyles.style15.copyWith(
              height: 0.4
            ),
            child: Text('\n$time',)
          )
        ],
      )
    );
  }
}
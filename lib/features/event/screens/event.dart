import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/commun/constents/colors.dart';
import 'package:kinema/commun/utils/navigation_methods.dart';
import 'package:kinema/commun/widgets/event_item.dart';
import 'package:kinema/features/event/controllers/event.dart';
import 'package:kinema/features/reservations/widgets/custom_appbar.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());

    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showTitle: true,
        title: 'Events',
        onGoBack: () => pop(context)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: List.generate(
                  eventController.events.length, 
                  (index) {
                    final event = eventController.events[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CustomColors.black3
                      ),
                      child: EventItem(event: event),
                    );
                  }
                ),
              ),
              const SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }
}
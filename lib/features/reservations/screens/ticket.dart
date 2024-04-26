import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/commun/widgets/custom_icon_button.dart';
import '/commun/widgets/download_button.dart';
import '/features/reservations/widgets/custom_appbar.dart';

import '../widgets/ticket_info.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black2,
      appBar: customAppBar(
        showTitle: true,
        title: 'Your Ticket!',
        actions: [
          CustomIconButton(
            child: SvgPicture.asset(
              'assets/icons/delete.svg',
              // ignore: deprecated_member_use
              color: CustomColors.white,
            ), 
            onPressed: (){}
          )
        ]
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: CustomColors.primaryBej,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 344,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: NetworkImage('https://musicart.xboxlive.com/7/14815100-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TicketInfo(
                      title: 'AVATAR 2', 
                      date: '10 AM - 01 PM', 
                      type: 'Fantasy, Sci-fi', 
                      seats: ['G4', 'G3', 'G8', 'G9'], 
                      image: AssetImage('assets/images/barcode.png')
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'You’ll receive this ticket on your email as well',
                style: TextStyles.style30.copyWith(
                  color: CustomColors.greyText3
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: DownloadButton(
                  onPressed: (){}
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
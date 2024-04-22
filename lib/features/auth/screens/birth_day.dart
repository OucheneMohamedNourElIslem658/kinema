import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/custom_cupertino_date_picker.dart';
import '/features/auth/widgets/background.dart';
import '/features/auth/widgets/custom_elevated_button.dart';

import '../../../commun/constents/text_styles.dart';

class BirthDayScreen extends StatelessWidget {
  const BirthDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              GestureDetector(
                onTap: (){},
                child:  SvgPicture.asset('assets/icons/back_arrow.svg'),
              ),
              const SizedBox(height: 20),
              Text(
                'What’s your date of birth?',
                style: TextStyles.style4,
              ),
              const Spacer(flex: 2),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 130,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -1000,
                        left: 0,
                        right: 0,
                        bottom: -1000,
                        child: CustomCupertinoDatePicker()
                      ),
                    ],
                  )
                )
              ),
              const Spacer(flex: 3),
              Center(
                child: CustomElevatedButton(
                  onPressed: (){}, 
                  width: null,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  child: Text(
                    'Next',
                    style: TextStyles.style2,
                  )
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
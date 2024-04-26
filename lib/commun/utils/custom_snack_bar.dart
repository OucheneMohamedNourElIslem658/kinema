import 'package:flutter/material.dart';
import 'package:kinema/commun/constents/colors.dart';
import 'package:kinema/commun/constents/text_styles.dart';

void showSnackBar(String message,BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: CustomColors.transparent,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150,
        left: 20,
        right: 20,
      ),
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        decoration: BoxDecoration(
          color: CustomColors.black3,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Text(
          message,
          style: TextStyles.style22,
        ),
      )
    ),
  );
}
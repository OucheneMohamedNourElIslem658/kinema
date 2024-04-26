import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class CardController extends GetxController {

  final cardItems = [
    {
      'name': 'Black Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1400
    },
    {
      'name': 'Red Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1400
    },
    {
      'name': 'Blue Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1400
    },
    {
      'name': 'Green Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1400
    },
    {
      'name': 'Yellow Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1400
    },
    {
      'name': 'White Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1400
    },
    {
      'name': 'Black Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1400
    },
  ];

  void deleteItem(int index){
    cardItems.removeAt(index);
    update();
  }

  late ScrollController scrollController;
  bool isScrollingUp = true;
  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(listenToScrollStatus);
    super.onInit();
  }

  void listenToScrollStatus(){
    if (scrollController.position.userScrollDirection != ScrollDirection.forward) {
      isScrollingUp = false;
    } else {
      isScrollingUp = true;
    }
    update();
  }
}
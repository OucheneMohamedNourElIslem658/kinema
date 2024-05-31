import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  final List<Map<String,dynamic>> cardItems = [];

  final market = [
    {
      'categorie': 'caps',
      'name': 'Black Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1400
    },
    {
      'categorie': 'caps',
      'name': 'Red Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1200
    },
    {
      'categorie': 'caps',
      'name': 'Blue Kinema Cap',
      'path': 'assets/images/cap.png',
      'price': 1000
    },
    {
      'categorie': 'shirts',
      'name': 'Red Kinema t-shirt',
      'path': 'assets/images/t_shirt.png',
      'price': 800
    },
    {
      'categorie': 'shirts',
      'name': 'Red Kinema t-shirt',
      'path': 'assets/images/t_shirt.png',
      'price': 900
    },
    {
      'categorie': 'shirts',
      'name': 'Red Kinema t-shirt',
      'path': 'assets/images/t_shirt.png',
      'price': 600
    },
    {
      'categorie': 'shirts',
      'name': 'Red Kinema t-shirt',
      'path': 'assets/images/t_shirt.png',
      'price': 70
    },
  ];

  void deleteItem(int index){
    cardItems.removeAt(index);
    update();
  }

  void addItem({
    required String name,
    required String path,
    required int price,
  }){
    cardItems.add({
      'name': name,
      'path': path,
      'price': price
    });
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
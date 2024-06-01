import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/state_manager.dart';
import 'package:kinema/commun/models/fidelity_item.dart';
import 'package:kinema/features/fidelity/repositories/fiedelity.dart';

class FidelityController extends GetxController {
  final List<FidelityItem> cardItems = [];

  void deleteItem(int index) {
    cardItems.removeAt(index);
    update();
  }

  void addItem(
    FidelityItem fidelityItem
  ) {
    cardItems.add(fidelityItem);
    update();
  }

  late ScrollController scrollController;
  bool isScrollingUp = true;

  void listenToScrollStatus() {
    if (scrollController.position.userScrollDirection !=
        ScrollDirection.forward) {
      isScrollingUp = false;
    } else {
      isScrollingUp = true;
    }
    update();
  }
    final _itemsRepo = FiedelityRepo();
  List<FidelityItem> items = [];

  Future<void> getItems() async {
    items = (await _itemsRepo.getItems()) ?? [];
    update();
  }

  void clearCard(){
    cardItems.clear();
    update();
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      scrollController = ScrollController();
      scrollController.addListener(listenToScrollStatus);
      await getItems();
    });
    super.onInit();
  }
}
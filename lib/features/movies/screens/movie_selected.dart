import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../controllers/show_hide_button.dart';
import '../widgets/description.dart';
import '../widgets/screen_with_shadow.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final showHideButtonController = Get.put(ShowHideButtonController());

    return Scaffold(
      body: GetBuilder<ShowHideButtonController>(
        builder: (_) {
          return ScreenWithShadow(
            backgroundImageURL: 'https://musicart.xboxlive.com/7/14815100-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080',
            onGoBack: () => GoRouter.of(context).go('/Movies'),
            showAppBar: true,
            showPayButton: showHideButtonController.isScrollingUp,
            scrollController: showHideButtonController.scrollController,
            child: const SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 200),
                  SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Description(),
                    ),
                  ),
                  SizedBox(height: 70)
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
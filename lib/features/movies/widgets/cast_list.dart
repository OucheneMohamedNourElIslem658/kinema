import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commun/constents/text_styles.dart';
import '../controllers/cast_scroll.dart';

class CastList extends StatelessWidget {
  const CastList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final castContoller = Get.put(CastScrollController());

    return GetBuilder<CastScrollController>(
      builder: (_) {
        return Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index,reason) => castContoller.changeActor(index),
                  viewportFraction: 0.14,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.1
                ),
                items: List.generate(
                  castContoller.cast.length, 
                  (index) {
                    final actor = castContoller.cast[index];
                    final url = actor['imageURL'] as String;
                    return Center(
                      child: AnimatedContainer(
                        height: castContoller.currentActor == index ? 70 : 35,
                        duration: const Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(url)
                          )
                        ),
                      ),
                    );
                  }
                ),
              )
            ),
            const SizedBox(height: 8),
            Text(
              castContoller.cast[castContoller.currentActor]['name'].toString(),
              style: TextStyles.style20,
            )
          ],
        );
      }
    );
  }
}

import 'package:flutter/material.dart';

import '../../../commun/constents/text_styles.dart';
import '../../../commun/widgets/imdb_rate.dart';

class DescriptionTile extends StatelessWidget {
  const DescriptionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "COCO",
              style: TextStyles.style13,
            ),
            const SizedBox(width: 15),
            const IMDBRate(
              rate: 7.5,
            )
          ],
        ),
        Text(
          'Animation, Musical',
          style: TextStyles.style17,
        )
      ],
    );
  }
}
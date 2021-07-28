import 'package:box_ui/box_ui.dart';
import 'package:box_ui/src/shared/styles.dart';
import 'package:flutter/material.dart';

import 'large_merchants_item_images_carousel.dart';

class LargeMerchantItem extends StatelessWidget {
  final List<String> images;
  final String name;
  final List<String> categories;
  final double? rating;
  final int? numberOfRatings;
  final int? deliveryInMinutes;
  final double? deliveryCost;
  final bool isClosed;

  const LargeMerchantItem(
      {Key? key,
      required this.images,
      required this.name,
      required this.categories,
      this.deliveryInMinutes,
      this.deliveryCost,
      this.rating,
      this.numberOfRatings,
      this.isClosed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LargeMerchantsItemImagesCarousel(
          images: images,
        ),
        verticalSpaceSmall,
        BoxText.subheading(name),
        verticalSpaceTiny,
        BoxText.body(
          categories.join(' • '),
          color: kcMediumGreyColor,
        ),
        verticalSpaceSmall,
        Row(
          children: [
            if (rating != null) ...[
              BoxText.caption(
                rating.toString(),
              ),
              horizontalSpaceTiny,
              Icon(
                Icons.star_rounded,
                color: kcPrimaryColor,
                size: 15,
              ),
              horizontalSpaceTiny,
              BoxText.caption(
                numberOfRatings.toString() + ' Ratings',
              ),
              horizontalSpaceTiny,
            ],
            if (deliveryInMinutes != null) ...[
              Icon(
                Icons.watch_later_rounded,
                color: Colors.black.withOpacity(0.6),
                size: 15,
              ),
              horizontalSpaceTiny,
              BoxText.caption(
                deliveryInMinutes.toString() + ' Min',
              ),
              horizontalSpaceTiny,
            ],
            if (deliveryCost != null) ...[
              BoxText.body(
                '•',
                color: kcMediumGreyColor.withOpacity(0.5),
              ),
              horizontalSpaceTiny,
              Icon(
                Icons.attach_money_rounded,
                color: kcMediumGreyColor,
                size: 15,
              ),
              horizontalSpaceTiny,
              BoxText.caption(
                deliveryCost == 0.0 ? 'Free' : deliveryCost.toString(),
              ),
            ]
          ],
        )
      ],
    );
  }
}

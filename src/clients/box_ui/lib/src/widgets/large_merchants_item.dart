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
        LargeMerchantsItemImagesCarsouel(
          images: images,
        ),
        verticalSpaceSmall,
        Text(name, style: subheadingStyle.copyWith(color: kcDeepGreyColor)),
        verticalSpaceTiny,
        Text(categories.join(' • '),
            style: bodyStyle.copyWith(color: kcMediumGreyColor)),
        verticalSpaceSmall,
        Row(
          children: [
            if (rating != null) ...[
              Text(
                rating.toString(),
                style: captionStyle.copyWith(
                    color: kcDeepGreyColor.withOpacity(0.74)),
              ),
              horizontalSpaceTiny,
              Icon(
                Icons.star_rounded,
                color: kcPrimaryColor,
                size: 15,
              ),
              horizontalSpaceTiny,
              Text(
                numberOfRatings.toString() + ' Ratings',
                style: captionStyle.copyWith(
                    color: kcDeepGreyColor.withOpacity(0.74)),
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
              Text(
                deliveryInMinutes.toString() + ' Min',
                style: captionStyle.copyWith(
                    color: kcDeepGreyColor.withOpacity(0.74)),
              ),
              horizontalSpaceTiny,
            ],
            if (deliveryCost != null) ...[
              Text('•',
                  style: bodyStyle.copyWith(
                      color: kcMediumGreyColor.withOpacity(0.5))),
              horizontalSpaceTiny,
              Icon(
                Icons.attach_money_rounded,
                color: kcMediumGreyColor,
                size: 15,
              ),
              horizontalSpaceTiny,
              Text(
                deliveryCost == 0.0 ? 'Free' : deliveryCost.toString(),
                style: captionStyle.copyWith(
                    color: kcDeepGreyColor.withOpacity(0.74)),
              ),
            ]
          ],
        )
      ],
    );
  }
}

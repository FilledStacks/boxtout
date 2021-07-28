import 'package:box_ui/src/shared/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LargeMerchantsItemImagesCarousel extends StatefulWidget {
  final List<String> images;
  const LargeMerchantsItemImagesCarousel({Key? key, required this.images})
      : super(key: key);

  @override
  _LargeMerchantsItemImagesCarouselState createState() =>
      _LargeMerchantsItemImagesCarouselState();
}

class _LargeMerchantsItemImagesCarouselState
    extends State<LargeMerchantsItemImagesCarousel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CarouselSlider(
              items: widget.images
                  .map((image) => Container(
                        width: double.infinity,
                        color: kcLightGreyColor,
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  aspectRatio: 1.8,
                  viewportFraction: 1,
                  onPageChanged: (currentPageIndex, _) {
                    setState(() {
                      _currentIndex = currentPageIndex;
                    });
                  })),
        ),
        _CarouselCustomIndexWidget(
          currentIndex: _currentIndex,
          images: widget.images,
        )
      ],
    );
  }
}

class _CarouselCustomIndexWidget extends StatelessWidget {
  final List<String> images;
  final int currentIndex;
  const _CarouselCustomIndexWidget(
      {Key? key, required this.currentIndex, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Row(
        children: [
          ...images.asMap().entries.map((map) => Container(
                margin: const EdgeInsets.only(right: 8),
                width: 8,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(currentIndex == map.key ? 1 : 0.3),
                    borderRadius: BorderRadius.circular(32)),
              ))
        ],
      ),
    );
  }
}

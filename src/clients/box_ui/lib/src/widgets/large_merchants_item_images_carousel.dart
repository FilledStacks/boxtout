import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LargeMerchantsItemImagesCarsouel extends StatefulWidget {
  final List<String> imagesUrl;
  const LargeMerchantsItemImagesCarsouel({Key? key, required this.imagesUrl})
      : super(key: key);

  @override
  _LargeMerchantsItemImagesCarsouelState createState() =>
      _LargeMerchantsItemImagesCarsouelState();
}

class _LargeMerchantsItemImagesCarsouelState
    extends State<LargeMerchantsItemImagesCarsouel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CarouselSlider(
              items: widget.imagesUrl
                  .map((imageUrl) => Image.network(
                        imageUrl,
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
        Positioned(
          bottom: 20,
          right: 20,
          child: Row(
            children: [
              ...widget.imagesUrl.asMap().entries.map((map) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 8,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(_currentIndex == map.key ? 1 : 0.3),
                        borderRadius: BorderRadius.circular(32)),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

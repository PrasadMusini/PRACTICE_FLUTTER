import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CustomCarousel extends StatelessWidget {
  final double height;
  final List<String>? carouselList;
  static List<String> imgList = const [
    'https://via.placeholder.com/600',
    'https://via.placeholder.com/600/92c952',
    'https://via.placeholder.com/600/771796',
    'https://via.placeholder.com/600/d32776',
    'https://via.placeholder.com/600/f66b97',
    'https://via.placeholder.com/600/56a8c2',
  ];

  const CustomCarousel({super.key, this.carouselList, required this.height});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: height,
        showIndicator: true,
        autoPlay: true,
        floatingIndicator: true,
        autoPlayCurve: Curves.easeInOut,
        padEnds: true,
        indicatorMargin: 12,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        slideIndicator: const CircularSlideIndicator(
            // indicatorBorderColor: Colors.grey,
            // currentIndicatorColor: Colors.red,
            indicatorRadius: 4),
      ),
      items: imgList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                int index = imgList.indexWhere((element) => element == item);
                print('click on item $index');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(right: 5),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: item,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                /* Image.network(
                  item,
                  height: 100,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
              
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  },
                ), */
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

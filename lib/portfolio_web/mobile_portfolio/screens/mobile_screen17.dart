import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class MobileScreen17 extends StatelessWidget {
  const MobileScreen17({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      // height: size.height * 0.8,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
      color: Colors.black,
      child:
          // Center(child: techBox()

          FlutterCarousel(
              options: CarouselOptions(
                // height: size.height * 0.65,
                height: 400,
                showIndicator: false,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.easeInOut,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlay: true,
                slideIndicator: const CircularSlideIndicator(
                  slideIndicatorOptions: SlideIndicatorOptions(
                    currentIndicatorColor: Colors.black,
                    indicatorRadius: 4,
                    indicatorBackgroundColor:
                        Color.fromARGB(255, 201, 200, 200),
                  ),
                ),
              ),
              items: List.generate(
                4,
                (index) => techBox(),
              )),

      /* Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          newsCard(size),
          /*  SizedBox(height: size.height * 0.05),
          ShadowButton(
            size: size,
            content: 'Explore More',
          ), */
        ],
      ), */
    );
  }

  Widget techBox() {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Web Development',
                style: Constants.txW8FpCw.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Image.asset(Assets.images.image1.path,
                fit: BoxFit.contain, width: 200, height: 200),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '- Web Development',
                      style: Constants.txW8FpCw.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '- Web Development',
                      style: Constants.txW8FpCw.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '- Web Development',
                      style: Constants.txW8FpCw.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '- Web ',
                      style: Constants.txW8FpCw.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '- Web ',
                      style: Constants.txW8FpCw.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '- Web ',
                      style: Constants.txW8FpCw.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

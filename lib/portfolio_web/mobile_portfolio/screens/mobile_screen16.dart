import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class MobileScreen16 extends StatelessWidget {
  const MobileScreen16({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      // height: size.height * 0.8,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
      color: const Color(0XFFe0ebf2),
      child: Center(
        child: FlutterCarousel(
            options: CarouselOptions(
              height: size.height * 0.64,
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
                  indicatorBackgroundColor: Color.fromARGB(255, 201, 200, 200),
                ),
              ),
            ),
            items: List.generate(
              4,
              (index) => newsCard(size),
            )),
      ),

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

  Container newsCard(Size size) {
    return Container(
      width: size.width * 0.75, //size.width / 4.6,
      // height: size.height * 0.62,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      // margin: EdgeInsets.only(left: size.width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(7, 7),
            blurRadius: 1,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'August 11, 1999',
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.bold,
            // ),
            style: Constants.txW7FpCb.copyWith(
              fontSize: (size.width * 0.6) * 0.08,
            ),
          ),
          // const SizedBox(height: 5),
          Text(
            'Fresh Design Ideas &\nInspiration For 2023',
            // style: TextStyle(
            //   fontSize: 24,
            //   fontWeight: FontWeight.bold,
            // ),
            style: Constants.txW7FpCb.copyWith(
              fontSize: (size.width * 0.6) * 0.05,
            ),
          ),
          // SizedBox(height: size.height * 0.02),
          SizedBox(
            // width: size.width / 5,
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: TextStyle(
                fontSize: (size.width * 0.6) * 0.04,
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            // width: size.width,
            child: Image.network(
              'https://petrix-react.vercel.app/images/blog_img_1.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('Error loading image');
              },
            ),
          ),
          // SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Read More',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(width: 10),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_right_sharp))
            ],
          ),
        ],
      ),
    );
  }
}

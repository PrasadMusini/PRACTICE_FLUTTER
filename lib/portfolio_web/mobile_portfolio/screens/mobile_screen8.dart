import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class MobileScreen8 extends StatelessWidget {
  const MobileScreen8({super.key});

  static final List<TechData> techInfo = [
    TechData(
        title: 'title',
        imagePath: 'assets/images/image1.png',
        skills: ['• skill1', '• skill2', '• skill3']),
    TechData(
        title: 'title',
        imagePath: 'assets/images/image2.png',
        skills: ['• skill1', '• skill2', '• skill3', '• skill4']),
    TechData(
        title: 'title',
        imagePath: 'assets/images/image3.png',
        skills: ['• skill1', '• skill2', '• skill3', '• skill4', '• skill5']),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFFe2eaf5),
      width: size.width,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.09, vertical: size.height * 0.05),
      child: Column(
        children: [
          Text(
            'We specialize in the design and development of your Webflow,Shopify or WordPress powered website. Webhosting support through\nWebflow, WP Engine or equivalent. SEO best practices with a focus on\npage speed optimization. Familiarity with MySQL, PHP, JavaScript,\nCloudflare, and WooCommerce.',
            style: Constants.txW7FpCb.copyWith(
              fontSize: 18,
              height: 2,
            ),
            // style: TextStyle(
            //   fontSize: 35,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
          SizedBox(height: size.height * 0.04),
          /* serviceBox(size, 'Web Development'),
          serviceBox(size, 'Web Development'),
          serviceBox(size, 'Web Development'),
          serviceBox(size, 'Web Development'),
          serviceBox(size, 'Test Development'),
          const Divider(), */
          FlutterCarousel(
              options: CarouselOptions(
                // height: size.height * 0.65,
                height: 420,
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
                  /*  currentIndicatorColor: Colors.black,
                  indicatorRadius: 4,
                  indicatorBackgroundColor: Color.fromARGB(255, 201, 200, 200), */
                ),
              ),
              items: List.generate(
                techInfo.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: techBox(techInfo[index]),
                ),
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget techBox(TechData data) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xFFe2eaf5),
        // color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.1), // Lighter shadow color with low opacity
            offset: const Offset(0, 4), // Offset for X and Y (X, Y)
            blurRadius: 10, // Blur radius
            spreadRadius: 2, // Spread radius
          ),
        ],
        /* boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(-4, 7),
            blurRadius: 4,
            spreadRadius: 0.3,
          ),
        ], */
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.title, //'Web Development',
                style: Constants.txW8FpCw.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(12),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Image.asset(data.imagePath,
                fit: BoxFit.contain, width: 180, height: 180),
          ),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              mainAxisAlignment: data.skills.length > 3
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      data.skills[0], //'- Web Development',
                      style: Constants.txW8FpCw.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      data.skills[1], //'- Web Development',
                      style: Constants.txW8FpCw.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      data.skills[2], //'- Web Development',
                      style: Constants.txW8FpCw.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                if (data.skills.length > 3) ...[
                  const Spacer(),
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
                ]
              ],
            ),
          )
        ],
      ),
    );
  }

  Column serviceBox(Size size, String service) {
    return Column(
      children: [
        const Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                service,
                style: Constants.txW7FpCb.copyWith(
                  fontSize: 14,
                ),
                // style: const TextStyle(
                //   fontSize: 30,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.remove_red_eye,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TechData {
  final String title;
  final String imagePath;
  final List<String> skills;

  TechData(
      {required this.title, required this.imagePath, required this.skills});
}

import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';
import 'package:practice_flutter/portfolio_web/utilities/shadow_button.dart';

class MobileScreen10 extends StatelessWidget {
  const MobileScreen10({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 1.1,
        color: const Color(0XFFe0ebf2),
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.09,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  // horizontal: size.width * 0.152,
                  //   vertical: size.height * 0.14
                  horizontal: size.width / 19,
                  // vertical: size.height * 0.16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    newsCard(size),
                    newsCard(size),
                    newsCard(size),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20, // 80
              child: Center(
                child: ShadowButton(
                  size: size,
                  content: 'Explore More',
                ),
              ),
            )
          ],
        ));
  }

  Container newsCard(Size size) {
    return Container(
      // width: size.width / 4, //size.width / 4.6,
      // height: size.height * 0.62,
      padding: const EdgeInsets.all(24),
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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'August 11, 2023',
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.bold,
            // ),
            style: Constants.txW7FpCb.copyWith(
              fontSize: size.width * 0.01,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'Fresh Design Ideas &\nInspiration For 2023',
            // style: TextStyle(
            //   fontSize: 24,
            //   fontWeight: FontWeight.bold,
            // ),
            style: Constants.txW7FpCb.copyWith(
              fontSize: size.width * 0.015,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          SizedBox(
            width: size.width / 5,
            child: const Text(
              'Duis aute irure dolor in reprehenderit fugiat',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            color: Colors.grey,
            width: size.width / 4.5,
            child: Image.network(
              'https://petrix-react.vercel.app/images/blog_img_1.jpg',
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('Error loading image');
              },
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Row(
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


/* 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 1.2,
        color: const Color(0XFFe0ebf2),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  // horizontal: size.width * 0.152,
                  //   vertical: size.height * 0.14
                  horizontal: size.width / 16,
                  vertical: size.height * 0.16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    newsCard(size),
                    newsCard(size),
                    newsCard(size),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 16, // 80
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(18), // 20
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(5, 5),
                        blurRadius: 1,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Explore More',
                    style: TextStyle(
                        color: Colors.white,
                        // fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Container newsCard(Size size) {
    return Container(
      color: Colors.white,
      width: size.width / 3.8, //size.width / 4.6,
      // height: size.height * 0.62,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'August 11, 2023',
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.bold,
            // ),
            style: Constants.txW7FpCb.copyWith(
              fontSize: size.width * 0.01,
            ),
          ),
          Text(
            'Fresh Design Ideas &\nInspiration For 2023',
            // style: TextStyle(
            //   fontSize: 24,
            //   fontWeight: FontWeight.bold,
            // ),
            style: Constants.txW7FpCb.copyWith(
              fontSize: size.width * 0.02,
            ),
          ),
          const Text(
            'Duis aute irure dolor in reprehenderit velit esse cillum dolore eu fugiat',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Image.network(
              'https://petrix-react.vercel.app/images/blog_img_1.jpg'),
          Row(
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
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class MobileScreen7 extends StatelessWidget {
  const MobileScreen7({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      // height: size.height * 1.5,
      color: const Color(0XFF010101),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.152,
      ).copyWith(top: size.height * 0.14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.network(
                      'https://petrix-react.vercel.app/images/portfolio_img_1.jpg',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('Error loading image');
                      },
                    ),
                    const SizedBox(height: 50),
                    Image.network(
                      'https://petrix-react.vercel.app/images/portfolio_img_2.jpg',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('Error loading image');
                      },
                    ),
                    const SizedBox(height: 50),
                    Image.network(
                      'https://petrix-react.vercel.app/images/portfolio_img_5.jpg',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('Error loading image');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Image.network(
                      'https://petrix-react.vercel.app/images/portfolio_img_6.jpg',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('Error loading image');
                      },
                    ),
                    const SizedBox(height: 50),
                    Image.network(
                      'https://petrix-react.vercel.app/images/portfolio_img_3.jpg',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('Error loading image');
                      },
                    ),
                    const SizedBox(height: 50),
                    Image.network(
                      'https://petrix-react.vercel.app/images/portfolio_img_4.jpg',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('Error loading image');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: (size.height * 0.14) * 0.4),
          Container(
            padding: EdgeInsets.all((size.height * 0.14) * 0.3),
            decoration: BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey)),
            child: Center(
              child: Column(
                children: [
                  const Icon(Icons.arrow_outward_outlined,
                      size: 18, color: Colors.white),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'See All Recent',
                        style: Constants.txW5FpCw.copyWith(
                          fontSize: size.width * 0.0085,
                        ),
                        // style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Projects',
                        style: Constants.txW5FpCw.copyWith(
                          fontSize: size.width * 0.0085,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: (size.height * 0.14) * 0.4),
        ],
      ),
    );
  }
}

/* class BorderedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double strokeWidth;
  final Color borderColor;

  const BorderedText({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.strokeWidth,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Text with border
        Text(
          text,
          style: textStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = borderColor,
          ),
        ),
        // Transparent text
        Text(
          text,
          style: textStyle.copyWith(color: Colors.transparent),
        ),
      ],
    );
  }
}
BorderedText(
                text: "Bordered Text",
                textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                strokeWidth: 0.4,
                borderColor: Colors.black,
              ), */
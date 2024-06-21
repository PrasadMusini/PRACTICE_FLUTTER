import 'package:flutter/material.dart';

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

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
                        'https://petrix-react.vercel.app/images/portfolio_img_1.jpg'),
                    const SizedBox(height: 50),
                    Image.network(
                        'https://petrix-react.vercel.app/images/portfolio_img_2.jpg'),
                    const SizedBox(height: 50),
                    Image.network(
                        'https://petrix-react.vercel.app/images/portfolio_img_5.jpg'),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Image.network(
                        'https://petrix-react.vercel.app/images/portfolio_img_6.jpg'),
                    const SizedBox(height: 50),
                    Image.network(
                        'https://petrix-react.vercel.app/images/portfolio_img_3.jpg'),
                    const SizedBox(height: 50),
                    Image.network(
                        'https://petrix-react.vercel.app/images/portfolio_img_4.jpg'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.all(35),
            decoration: BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey)),
            child: const Center(
              child: Column(
                children: [
                  Icon(Icons.arrow_outward_outlined,
                      size: 18, color: Colors.white),
                  SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'See All Recent',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Projects',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
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
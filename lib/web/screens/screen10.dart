import 'package:flutter/material.dart';

class Screen10 extends StatelessWidget {
  const Screen10({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        color: const Color(0XFFe0ebf2),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.152,
                    vertical: size.height * 0.14),
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
              bottom: 80,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Explore More',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
      width: size.width / 4.6,
      height: size.height * 0.62,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'August 11, 2023',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Fresh Design Ideas &\nInspiration For 2023',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
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

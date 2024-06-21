import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Center(
              child: Icon(
                Icons.person,
                size: 400,
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.089)
                  .copyWith(top: size.height * 0.24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 300,
                        child: Text(
                            'It is a long established fact that a reader will be distracted by the readable content of a page.'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.home),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'This is Center Text',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.089,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.home),
                      ),
                      const SizedBox(
                        width: 300,
                        child: Text(
                            'Feel Free to send me a message if you want to enhance your recruitment. \nFacebook . Twitter . Linkedin . Dribbble'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     width: size.width,
          //     height: 100,
          //     color: Colors.black,
          //   ),
          // )
        ],
      ),
    );
  }
}

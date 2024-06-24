import 'package:flutter/material.dart';

class Screen13 extends StatelessWidget {
  const Screen13({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.4,
        color: const Color(0xFFfaebdf),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            socialMediaAccountBox(size, 'My Instagram'),
            const VerticalDivider(
              width: 0.5,
              thickness: 0.3,
              color: Colors.grey,
            ),
            socialMediaAccountBox(size, 'My Instagram'),
            const VerticalDivider(
              width: 0.5,
              thickness: 0.3,
              color: Colors.grey,
            ),
            socialMediaAccountBox(size, 'My Instagram'),
            const VerticalDivider(
              width: 0.5,
              thickness: 0.3,
              color: Colors.grey,
            ),
            socialMediaAccountBox(size, 'My Instagram'),
          ],
        ));
  }

  Container socialMediaAccountBox(Size size, String content) {
    return Container(
      width: size.width / 4.5,
      height: size.height,
      alignment: Alignment.center,
      child: Text(
        content,
        style: TextStyle(
            fontFamily: 'Sora',
            color: Colors.black,
            fontSize: size.width * 0.024,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

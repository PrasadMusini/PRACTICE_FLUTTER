import 'package:flutter/material.dart';

class MobileScreen13 extends StatelessWidget {
  const MobileScreen13({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 100,
        color: const Color(0xFFfaebdf),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaAccountBox(
                size: size,
                content: 'Instagram',
                hoverColor: const Color(0XFFFD1D1D)),
            const VerticalDivider(
              width: 0.5,
              thickness: 0.3,
              color: Colors.grey,
            ),
            SocialMediaAccountBox(
                size: size,
                content: 'Facebook',
                hoverColor: const Color(0XFF3B5998)),
            const VerticalDivider(
              width: 0.5,
              thickness: 0.3,
              color: Colors.grey,
            ),
            SocialMediaAccountBox(
                size: size,
                content: 'LinkedIn',
                hoverColor: const Color(0XFF0077b5)),
            const VerticalDivider(
              width: 0.5,
              thickness: 0.3,
              color: Colors.grey,
            ),
            SocialMediaAccountBox(
                size: size,
                content: 'Github',
                hoverColor: const Color.fromARGB(255, 100, 100, 101)),
          ],
        ));
  }

  // Container socialMediaAccountBox(Size size, String content) {
  //   return Container(
  //     width: size.width / 4.5,
  //     height: size.height,
  //     alignment: Alignment.center,
  //     child: Text(
  //       content,
  //       style: TextStyle(
  //           fontFamily: 'Sora',
  //           color: Colors.black,
  //           fontSize: size.width * 0.024,
  //           fontWeight: FontWeight.w700),
  //     ),
  //   );
  // }
}

class SocialMediaAccountBox extends StatefulWidget {
  final Size size;
  final String content;
  final Color hoverColor;

  const SocialMediaAccountBox({
    super.key,
    required this.size,
    required this.content,
    required this.hoverColor,
  });

  @override
  State<SocialMediaAccountBox> createState() => _SocialMediaAccountBoxState();
}

class _SocialMediaAccountBoxState extends State<SocialMediaAccountBox> {
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          textColor = widget.hoverColor;
        });
      },
      onExit: (_) {
        setState(() {
          textColor = Colors.black;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceInOut,
        width: widget.size.width / 4.5,
        height: widget.size.height,
        alignment: Alignment.center,
        child: Text(
          widget.content,
          style: TextStyle(
            fontFamily: 'Sora',
            color: textColor,
            fontSize: widget.size.width * 0.024,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

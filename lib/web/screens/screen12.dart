import 'package:flutter/material.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/gen/fonts.gen.dart';
import 'package:practice_flutter/web/utilities/constants.dart';

class Screen12 extends StatelessWidget {
  const Screen12({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.16,
      color: const Color(0xFFea552b),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HoverText(
            size: size,
            content: 'info@demo.com',
          ),
          // Text(
          //   'info@demo.com',
          //   style: TextStyle(
          //       fontFamily: 'Sora',
          //       color: Colors.white,
          //       fontSize: size.width * 0.016,
          //       fontWeight: FontWeight.w800),
          //   // style: TextStyle(
          //   //     color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          const Text(
            '/',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          HoverText(
            size: size,
            content: '14 tottenham road, london, england',
          ),
          // Text(
          //   '14 tottenham road, london, england',
          //   style: TextStyle(
          //       fontFamily: 'Sora',
          //       color: Colors.white,
          //       fontSize: size.width * 0.016,
          //       fontWeight: FontWeight.w800),
          // ),
          Text(
            '/',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: size.width * 0.016,
                fontWeight: FontWeight.w800),
          ),
          HoverText(
            size: size,
            content: '+1(0) 987 654 321',
          )
          // Text(
          //   '+1(0) 987 654 321',
          //   style: TextStyle(
          //       fontFamily: 'Sora',
          //       color: Colors.white,
          //       fontSize: size.width * 0.016,
          //       fontWeight: FontWeight.w800),
          // ),
        ],
      ),
    );
  }
}

class HoverText extends StatefulWidget {
  const HoverText({
    super.key,
    required this.size,
    required this.content,
  });

  final Size size;
  final String content;

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: Text(
          widget.content,
          style: TextStyle(
              fontFamily: FontFamily.sora,
              color: isHover ? Colors.black : Colors.white,
              fontSize: widget.size.width * 0.016,
              fontWeight: FontWeight.w800),
          // style: TextStyle(
          //     fontFamily: 'Sora',
          //     color: isHover ? Colors.black : Colors.white,
          //     fontSize: widget.size.width * 0.016,
          //     fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

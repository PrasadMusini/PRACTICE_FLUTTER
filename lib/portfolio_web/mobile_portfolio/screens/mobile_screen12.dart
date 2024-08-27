import 'package:flutter/material.dart';

class MobileScreen12 extends StatelessWidget {
  const MobileScreen12({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 50,
      color: const Color(0xFFea552b),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HoverText(
            size: size,
            content: 'info@demo.com',
          ),
          Text(
            '/',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.width * 0.043,
                fontWeight: FontWeight.w900),
          ),
          HoverText(
            size: size,
            content: '14 tottenham road, london, england',
          ),
          Text(
            '/',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.width * 0.043,
                fontWeight: FontWeight.w900),
          ),
          HoverText(
            size: size,
            content: '+1(0) 987 654 321',
          )
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
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: widget.size.width * 0.023,
              fontWeight: FontWeight.w900),
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

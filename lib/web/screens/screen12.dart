import 'package:flutter/material.dart';

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
          Text(
            'info@demo.com',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: size.width * 0.016,
                fontWeight: FontWeight.w800),
            // style: TextStyle(
            //     color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            '/',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '14 tottenham road, london, england',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: size.width * 0.016,
                fontWeight: FontWeight.w800),
          ),
          Text(
            '/',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: size.width * 0.016,
                fontWeight: FontWeight.w800),
          ),
          Text(
            '+1(0) 987 654 321',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: size.width * 0.016,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

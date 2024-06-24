import 'package:flutter/material.dart';

class Screen11 extends StatelessWidget {
  const Screen11({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.8, // size.height * 0.5,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do you have a question, an idea, or a\nproject you need help with? Contact us!',
            // style: TextStyle(
            //   fontSize: 30,
            //   color: Colors.white,
            //   fontWeight: FontWeight.bold,
            // ),
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.white,
                fontSize: size.width * 0.028,
                fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          Container(
            width: size.width / 2,
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.05,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                // color: Colors.black,
                border: Border.all(color: Colors.grey)),
            child: Text(
              'Contact Form',
              style: TextStyle(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontSize: size.width * 0.016,
                  fontWeight: FontWeight.w800),
              // style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 22,
              //     fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

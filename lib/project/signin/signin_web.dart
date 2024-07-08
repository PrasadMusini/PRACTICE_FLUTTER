import 'package:flutter/material.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.07,
            vertical: size.height * 0.05,
          ),
          color: Colors.grey,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  // width: size.width * 0.5 - size.width * 0.07,
                  // height: size.height * 0.8 - size.height * 0.05,
                  color: Colors.grey[200],
                ),
              ),
              Expanded(
                child: Container(
                  // width: size.width * 0.5 - size.width * 0.07,
                  // height: size.height * 0.8 - size.height * 0.05,
                  color: Colors.grey[300],
                ),
              ),
            ],
          )

          /*  Row(
          children: [
            Container(
              width: size.width * 0.5 - size.width * 0.07,
              height: size.height * 0.8 - size.height * 0.05,
              color: Colors.red[200],
            ),
            // Container(
            //   width: size.width * 0.5 - size.width * 0.07,
            //   height: size.height * 0.8 - size.height * 0.05,
            //   color: Colors.white,
            //   padding: EdgeInsets.symmetric(
            //     horizontal: size.width * 0.07,
            //   ),
            //   child: const LoginMobile(),
            // ),
          ],
        ), */
          ),
    );
  }

  Widget box({required Color color, int quarterTurns = 0, double size = 100}) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}

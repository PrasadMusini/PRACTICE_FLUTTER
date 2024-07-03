import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_flutter/animations/effects/top_bounce_animation.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFFe2eaf5),
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Image.network(
                'https://petrix-react.vercel.app/images/banner_img.png',
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              // color: Colors.green.shade400,
              padding: EdgeInsets.symmetric(horizontal: size.width / 16)
                  .copyWith(top: size.height * 0.14), // size.height * 0.24
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width / 4, // size.width / 5.3,
                        child: const Text(
                          'Hello, I’m David Petrix, UX/UI designer and front-end developer based in san francisco.',
                          style: Constants.txW6F18Cb,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                              height: size.height * 0.1,
                              child: HoverIconContainer(size: size)),
                          SizedBox(width: size.width * 0.01),
                          const Text(
                            'Work\nProcess',
                            style: Constants.txW6F18Cb,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.022,
                            height: size.height / 9.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                            ),
                            alignment: Alignment.center,
                            child: const BounceFromTopAnimation(
                              delay: 1,
                              begin: -20,
                              end: 20,
                              child: Icon(Icons.arrow_downward_rounded),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            'Scroll\nDown',
                            style: Constants.txW6F18Cb,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width / 4, // size.width / 5.22,
                        child: const Text(
                          'Feel Free to send me a message if you want to enhance your recruitment. \nFacebook . Linkedin . Instagram',
                          style: Constants.txW6F18Cb,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    // height: size.height / 7.2,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dev ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: size.width * 0.089,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Prasad',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    fontSize: size.width * 0.089,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2.5
                      ..color = Colors.black,
                  ),
                ),
                Text(
                  ' Musini',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: size.width * 0.089,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HoverIconContainer extends StatefulWidget {
  final Size size;

  const HoverIconContainer({Key? key, required this.size}) : super(key: key);

  @override
  State<HoverIconContainer> createState() => _HoverIconContainerState();
}

class _HoverIconContainerState extends State<HoverIconContainer> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(
          _isHovering ? widget.size.height * 0.02 : widget.size.height * 0.03,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 1.3),
          color: _isHovering ? Colors.black : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.add,
          color: _isHovering ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

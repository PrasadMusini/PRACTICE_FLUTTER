import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';
import 'package:typing_text/typing_text.dart';

class MobileScreen1 extends StatelessWidget {
  const MobileScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFFe2eaf5),
      width: size.width,
      height: size.height * 0.8,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Image.network(
                  'https://petrix-react.vercel.app/images/banner_img.png',
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text('Error loading image');
                  },
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                // color: Colors.green.shade400,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello there, I am',
                      style: Constants.txW6F18Cb.copyWith(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_circle_right_outlined),
                        // Icon(Icons.arrow_right_rounded),
                        SizedBox(width: 10),
                        Flexible(
                          child: TypingText(
                            words: [
                              'Flutter Developer',
                              'Full Stack Java Developer',
                              'Android Developer'
                            ],
                            letterSpeed: Duration(milliseconds: 100),
                            wordSpeed: Duration(milliseconds: 1000),
                            style: Constants.txW6F18Cb,
                          ),
                        ),
                      ],
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
                    'Durga ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Prasad',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: size.width * 0.08,
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
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverIconContainer extends StatefulWidget {
  final Size size;

  const HoverIconContainer({super.key, required this.size});

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

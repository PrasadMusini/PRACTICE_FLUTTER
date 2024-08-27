import 'package:animate_text/animate_text.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MobileScreen3 extends StatelessWidget {
  const MobileScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      // height: 500,
      padding:
          EdgeInsets.symmetric(horizontal: 25, vertical: size.height * 0.1),
      color: const Color(0xfffae8e0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://petrix-react.vercel.app/_next/static/media/about_shapes.df78a495.png',
            width: size.width * 0.06,
          ),
          const SizedBox(height: 20),
          /* Text(
            'Hello! I\'m Durga Prasad Musini, a passionate software developer based in Hyderabad, India. I have strong hands-on experience with Angular, Spring Boot, and Flutter. My journey in the tech world began with comprehensive training in Java Full Stack Development at JSpiders, where I honed my skills in various technologies.\n\nCurrently, I am working as a Flutter developer, where I contribute to building innovative and user-friendly mobile applications for both Android and iOS platforms. My experience spans developing dynamic web and mobile applications that provide seamless user experiences.\n\nIn my free time, I enjoy exploring new technologies and continuously learning to stay updated with industry trends. I am dedicated to delivering high-quality, efficient, and scalable software solutions.\n\nFeel free to explore my portfolio to see my projects, skills, and certifications. Let\'s connect and build something great together!',
            style: Constants.txW6F18Cb.copyWith(
              // fontSize: 30,
              fontSize: 16,
              height: 2,
            ),
          ), */
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
              fontFamily: 'Agne',
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                    'Hello! I\'m Durga Prasad Musini, a passionate software developer based in Hyderabad, India. I have strong hands-on experience with Angular, Spring Boot, and Flutter. My journey in the tech world began with comprehensive training in Java Full Stack Development at JSpiders, where I honed my skills in various technologies.\n\nCurrently, I am working as a Flutter developer, where I contribute to building innovative and user-friendly mobile applications for both Android and iOS platforms. My experience spans developing dynamic web and mobile applications that provide seamless user experiences.\n\nIn my free time, I enjoy exploring new technologies and continuously learning to stay updated with industry trends. I am dedicated to delivering high-quality, efficient, and scalable software solutions.\n\nFeel free to explore my portfolio to see my projects, skills, and certifications. Let\'s connect and build something great together!',
                    cursor: '|'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    '2+',
                    style: Constants.txW8FsCb.copyWith(
                      fontSize: size.width * 0.06,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Year of \nExperience',
                    style: Constants.txW6F16Cb.copyWith(
                      fontSize: size.width * 0.025,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '2+',
                    style: Constants.txW8FsCb.copyWith(
                      fontSize: size.width * 0.06,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Year of \nExperience',
                    style: Constants.txW6F16Cb.copyWith(
                      fontSize: size.width * 0.025,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '2+',
                    style: Constants.txW8FsCb.copyWith(
                      fontSize: size.width * 0.06,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Year of \nExperience',
                    style: Constants.txW6F16Cb.copyWith(
                      fontSize: size.width * 0.025,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const DownloadCvButton(content: 'Download CV')
        ],
      ),
    );
  }
}

class DownloadCvButton extends StatefulWidget {
  const DownloadCvButton({
    super.key,
    required this.content,
  });

  final String content;

  @override
  State<DownloadCvButton> createState() => _DownloadCvButtonState();
}

class _DownloadCvButtonState extends State<DownloadCvButton> {
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
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isHover ? Constants.orangeColor : Colors.black,
          ),
          child: Text(widget.content,
              style: Constants.txW6F18Cw.copyWith(
                fontSize: 12,
                color: isHover ? Colors.black : Colors.white,
              )),
        ),
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _fadeInText();
  }

  void _fadeInText() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(seconds: 2),
      child: const Text(
        'Hello! I\'m Durga Prasad Musini, a passionate software developer based in Hyderabad, India. I have strong hands-on experience with Angular, Spring Boot, and Flutter. My journey in the tech world began with comprehensive training in Java Full Stack Development at JSpiders, where I honed my skills in various technologies.\n\nCurrently, I am working as a Flutter developer, where I contribute to building innovative and user-friendly mobile applications for both Android and iOS platforms. My experience spans developing dynamic web and mobile applications that provide seamless user experiences.\n\nIn my free time, I enjoy exploring new technologies and continuously learning to stay updated with industry trends. I am dedicated to delivering high-quality, efficient, and scalable software solutions.\n\nFeel free to explore my portfolio to see my projects, skills, and certifications. Let\'s connect and build something great together!',
        style: TextStyle(
          fontSize: 16,
          height: 2,
        ),
      ),
    );
  }
}

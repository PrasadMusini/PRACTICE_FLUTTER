import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height -
            size.height * 0.14, // later subtract with header height
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.152,
            vertical: size.height * 0.05), // vertical: size.height * 0.14
        color: const Color(0xfffae8e0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: const Color.fromARGB(255, 247, 238, 235),
                child: Image.network(
                    'https://petrix-react.vercel.app/_next/static/media/about_shapes.df78a495.png'),
                // const Icon(
                //   Icons.person,
                //   size: 100,
                // ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SizedBox(
                // color: Colors.grey.shade400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://petrix-react.vercel.app/_next/static/media/about_shapes.df78a495.png',
                      width: size.width * 0.02,
                    ),
                    // Icon(
                    //   Icons.stream_sharp,
                    //   size: size.width * 0.02,
                    // ),
                    Text(
                      'Hello! I’m David Petrix. Web designer from USA, California, San Francisco. I have rich experience in web site design and building, lso I am good at wordpress. I love to talk with you about our unique.',
                      style: Constants.txW6F18Cb.copyWith(
                        // fontSize: 30,
                        fontSize: size.width * 0.016,
                        height: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '2+',
                              style: Constants.txW8FsCb.copyWith(
                                fontSize: size.height * 0.06,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Year of \nExperience',
                              style: Constants.txW6F16Cb,
                              // style: TextStyle(
                              //   fontSize: 18,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '2+',
                              style: Constants.txW8FsCb.copyWith(
                                fontSize: size.height * 0.06,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Year of \nExperience',
                              style: Constants.txW6F16Cb,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '2+',
                              style: Constants.txW8FsCb.copyWith(
                                fontSize: size.height * 0.06,
                              ),
                              // style: TextStyle(
                              //     fontFamily: 'Sora',
                              //     color: Colors.black,
                              //     fontSize: size.height * 0.06,
                              //     fontWeight: FontWeight.w800),
                              // style: TextStyle(
                              //   fontSize: 45,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Year of \nExperience',
                              style: Constants.txW6F18Cb,
                            ),
                          ],
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    const DownloadCvButton(content: 'Download CV')
                  ],
                ),
              ),
            ),
          ],
        ));
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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isHover ? Constants.orangeColor : Colors.black,
          ),
          child: Text(widget.content,
              style: Constants.txW6F18Cw.copyWith(
                color: isHover ? Colors.black : Colors.white,
              )),
        ),
      ),
    );
  }
}

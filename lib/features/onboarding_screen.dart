import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_flutter/common_utils/common_utils.dart';
import 'package:practice_flutter/gen/assets.gen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  //MARK: Animated dots
  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF000000),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            height: SizeConfig.blockV! * 35,
                          ),
                          SizedBox(
                            height: (height >= 840) ? 60 : 30,
                          ),
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              fontSize: (width <= 550) ? 30 : 35,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            contents[i].desc,
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w300,
                              fontSize: (width <= 550) ? 17 : 25,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (int index) => _buildDots(
                            index: index,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: _currentPage + 1 == contents.length
                            ? Padding(
                                padding: const EdgeInsets.all(30),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DashBoardPage(),
                                        ),
                                        (route) => false);

                                    await setSeenOnboarding();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: (width <= 550)
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 100, vertical: 20)
                                        : EdgeInsets.symmetric(
                                            horizontal: width * 0.2,
                                            vertical: 25),
                                    textStyle: TextStyle(
                                        fontSize: (width <= 550) ? 13 : 17),
                                  ),
                                  child: const Text("START"),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        _controller.jumpToPage(2);
                                      },
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: (width <= 550) ? 13 : 17,
                                        ),
                                      ),
                                      child: const Text(
                                        "SKIP",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        elevation: 0,
                                        padding: (width <= 550)
                                            ? const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 20)
                                            : const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 25),
                                        textStyle: TextStyle(
                                            fontSize: (width <= 550) ? 13 : 17),
                                      ),
                                      child: const Text("NEXT"),
                                    ),
                                  ],
                                ),
                              )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
  }
}

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        bool result = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: const Text('Title'),
              content: const Text('Dialog Content'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );

        if (result) {
          SystemNavigator.pop();
        }
      },
      child: const Scaffold(
        body: Center(child: Text('Welcome to dashboard.')),
      ),
    );
  }
}

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Track Your work and get the result",
    image: Assets.images.image1.path,
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardingContents(
    title: "Stay organized with team",
    image: Assets.images.image2.path,
    desc: '''But understanding the contributions our colleagues make 
        to our teams and companies.''',
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: Assets.images.image3.path,
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];

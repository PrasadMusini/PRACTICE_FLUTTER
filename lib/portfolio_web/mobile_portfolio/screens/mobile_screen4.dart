import 'package:flutter/material.dart';
import 'package:practice_flutter/animations/effects/loading_numbers_animation.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class MobileScreen4 extends StatelessWidget {
  const MobileScreen4({super.key});

  static final List<SkillSet> skills = [
    SkillSet('Flutter',
        // 'https://freebiehive.com/wp-content/uploads/2022/10/Google-Flutter-Icon-PNG.jpg'
        'https://w7.pngwing.com/pngs/67/315/png-transparent-flutter-hd-logo-thumbnail.png'
        ),
    SkillSet('Dart',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Dart-logo-icon.svg/2048px-Dart-logo-icon.svg.png'),
    SkillSet('Java',
        'https://e7.pngegg.com/pngimages/123/816/png-clipart-computer-icons-java-%E5%92%96%E5%95%A1%E6%B5%B7%E6%8A%A5%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90-miscellaneous-text.png'),
    SkillSet('Javascript',
        'https://e7.pngegg.com/pngimages/87/538/png-clipart-javascript-scalable-graphics-logo-encapsulated-postscript-javascript-icon-text-logo-thumbnail.png'),
    SkillSet('Python',
        'https://image.similarpng.com/very-thumbnail/2021/12/Python-programming-logo-on-transparent-background-PNG.png'),
    SkillSet('NodeJS',
        'https://w7.pngwing.com/pngs/452/24/png-transparent-js-logo-node-logos-and-brands-icon-thumbnail.png'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: 400,
      width: size.width,
      color: Colors.black,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.1),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: const Text(
              'Explore the diverse range of skills I\'ve honed through years of dedicated practice and professional experience. These competencies empower me to deliver high-quality, innovative software solutions.',
              style: TextStyle(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: size.width,
            height: 200,
            child: ListView.separated(
              itemCount: skills.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return testBox(size, skills[index]);
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: size.width * 0.12),
            ),
          ),
        ],
      ),
    );
  }

  Widget testBox(Size size, SkillSet skillSet) {
    return Column(
      children: [
        Container(
          width: 80, //9.9
          // height: 120,
          alignment: Alignment.center,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0XFF0b0b0b),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color.fromARGB(115, 168, 160, 160),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.network(
                  skillSet
                      .link, //'https://petrix-react.vercel.app/images/skill_icon_1.png',
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text('Error loading image');
                  },
                ),
              ),
              const SizedBox(height: 20),
              AnimationLoadingNumbers(
                percentage: 99,
                delay: 5,
                style: Constants.txW5FsCb.copyWith(fontSize: size.width * 0.03),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          skillSet.name,
          style: Constants.txW8FpCw.copyWith(
            fontSize: size.width * 0.04,
          ),
        ),
      ],
    );
  }

  Widget brandBox(Size size) {
    return Column(
      children: [
        Container(
          width: 60, //9.9
          height: 120,
          alignment: Alignment.center,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0XFF0b0b0b),
            borderRadius: BorderRadius.circular(35),
            border: Border.all(
              color: const Color.fromARGB(115, 168, 160, 160),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.network(
                  'https://petrix-react.vercel.app/images/skill_icon_1.png',
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text('Error loading image');
                  },
                ),
              ),
              const SizedBox(height: 20),
              AnimationLoadingNumbers(
                percentage: 99,
                delay: 5,
                style: Constants.txW5FsCb.copyWith(fontSize: size.width * 0.03),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Figma',
          style: Constants.txW8FpCw.copyWith(
            fontSize: size.width * 0.04,
          ),
        ),
      ],

      //  const SizedBox(
      //     width: 50,
      //   )
    );
  }
}

class SkillSet {
  final String name;
  final String link;

  SkillSet(this.name, this.link);
}

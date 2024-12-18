import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:practice_flutter/animations/extensions.dart';

class TextAnimations extends StatelessWidget {
  const TextAnimations({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Hello World!").animate().fade().scale(),
            const Text("Hello111")
                .animate()
                .fade(duration: 500.ms)
                .scale(delay: 500.ms),
            const Text("Hello World!222")
                .animate()
                .fadeIn() // uses `Animate.defaultDuration`
                .scale() // inherits duration from fadeIn
                .move(
                    delay: 300.ms,
                    duration: 600.ms) // runs after the above w/new duration
                .blurXY(),
            // an opacity of 1 is "neutral"
            const Text("Hello333").animate().fade(),
            const Text("Hello444").animate().fade(begin: 0.5),
            const Text("Hello555").animate().fade(end: 0.5),
            const Text("Hello666")
                .animate()
                .fadeIn(duration: 600.ms)
                .then(delay: 200.ms)
                .slide(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ),
            const Text("Hello777").animate().custom(
                duration: 300.ms,
                builder: (context, value, child) => Container(
                      color: Color.lerp(Colors.red, Colors.blue, value),
                      padding: const EdgeInsets.all(8),
                      child: child,
                    )),
            Animate().toggle(
              duration: 2.seconds,
              builder: (_, value, __) => Text(value ? "Before" : "After"),
            ),
            const Text("Before").animate().swap(
                duration: 900.ms, builder: (_, __) => const Text("After")),
            const Text("Horrible Pulsing Text")
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .fadeOut(curve: Curves.easeInOut),

            const Text("Hello")
                .animate()
                .fadeIn(duration: 600.ms)
                .callback(duration: 300.ms, callback: (_) => print('halfway')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SecondScreen(),
            ),
          );
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            /*  const Text("Hello333").animate().fade(),
            const Text("Hello444").animate().fade(begin: 0.5),
            const Text("Hello555").animate().fade(end: 0.5), */
            /* const Text(
              'Hello! I\'m Durga Prasad Musini, a passionate software developer based in Hyderabad, India. I have strong hands-on experience with Angular, Spring Boot, and Flutter. My journey in the tech world began with comprehensive training in Java Full Stack Development at JSpiders, where I honed my skills in various technologies.\n\nCurrently, I am working as a Flutter developer, where I contribute to building innovative and user-friendly mobile applications for both Android and iOS platforms. My experience spans developing dynamic web and mobile applications that provide seamless user experiences.\n\nIn my free time, I enjoy exploring new technologies and continuously learning to stay updated with industry trends. I am dedicated to delivering high-quality, efficient, and scalable software solutions.\n\nFeel free to explore my portfolio to see my projects, skills, and certifications. Let\'s connect and build something great together!',
              style: TextStyle(
                fontSize: 16,
                height: 2,
              ),
            ).animate().fadeIn(duration: 1000.ms).then(delay: 1000.ms).slide(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ), */
            const Text(
              'Hello! I\'m Durga Prasad Musini, a passionate software developer based in Hyderabad, India. I have strong hands-on experience with Angular, Spring Boot, and Flutter. My journey in the tech world began with comprehensive training in Java Full Stack Development at JSpiders, where I honed my skills in various technologies.\n\nCurrently, I am working as a Flutter developer, where I contribute to building innovative and user-friendly mobile applications for both Android and iOS platforms. My experience spans developing dynamic web and mobile applications that provide seamless user experiences.\n\nIn my free time, I enjoy exploring new technologies and continuously learning to stay updated with industry trends. I am dedicated to delivering high-quality, efficient, and scalable software solutions.\n\nFeel free to explore my portfolio to see my projects, skills, and certifications. Let\'s connect and build something great together!',
              style: TextStyle(
                fontSize: 16,
                height: 2,
              ),
            ).fadeSlide()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TextAnimations(),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_flutter/web/utilities/constants.dart';

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
            height: size.height * 0.07,
          ),
          ContactMeButton(
            size: size,
            content: 'Contact Form',
            hoverColor: Constants.orangeColor,
          )
        ],
      ),
    );
  }
}

class ContactMeButton extends StatefulWidget {
  const ContactMeButton({
    super.key,
    required this.size,
    required this.content,
    required this.hoverColor,
  });

  final Size size;
  final String content;
  final Color hoverColor;

  @override
  State<ContactMeButton> createState() => _ContactMeButtonState();
}

class _ContactMeButtonState extends State<ContactMeButton> {
  Color textColor = Colors.black;

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          textColor = widget.hoverColor;
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          textColor = Colors.black;
          isHover = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: Container(
          width: widget.size.width / 2.2,
          padding: EdgeInsets.symmetric(
            vertical: widget.size.height * 0.04,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isHover ? Constants.orangeColor : Colors.black,
              border: Border.all(color: Colors.grey)),
          child: Text(
            widget.content, //'Contact Form',
            style: TextStyle(
                fontFamily: 'Sora',
                color: isHover ? Colors.black : Colors.white,
                fontSize: widget.size.width * 0.016,
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

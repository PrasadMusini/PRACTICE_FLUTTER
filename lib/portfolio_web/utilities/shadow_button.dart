import 'package:flutter/material.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class ShadowButton extends StatefulWidget {
  const ShadowButton({
    super.key,
    required this.size,
    required this.content,
  });

  final Size size;
  final String content;

  @override
  State<ShadowButton> createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> {
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
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Container(
          width: widget.size.width / 7.4,
          height: widget.size.height * 0.085, // 0.075
          alignment: Alignment.center,
          // padding: const EdgeInsets.all(20), // 20
          decoration: BoxDecoration(
            color: isHover ? Constants.orangeColor : Colors.black,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(5, 5),
                blurRadius: 1,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: Text(
            widget.content,
            style: Constants.txW8FpCw.copyWith(
              fontSize: widget.size.width * 0.01,
              color: isHover ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

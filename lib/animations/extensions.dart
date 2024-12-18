import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension FadeSlideAnimation on Widget {
  Widget fadeSlide({
    Duration duration = const Duration(milliseconds: 1500),
    Curve curve = Curves.easeInOut,
    Offset beginOffset = const Offset(-1, 0),
    Offset endOffset = Offset.zero,
  }) {
    return animate().fadeIn(duration: duration, curve: curve).slide(
          begin: beginOffset,
          end: endOffset,
          curve: curve,
          duration: duration,
        );
  }
}

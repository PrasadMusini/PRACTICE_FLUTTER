import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeBtn extends StatelessWidget {
  final Future<bool?> Function(bool)? onTap;
  final Widget? Function(bool)? likeBuilder;
  const LikeBtn({super.key, this.onTap, required this.likeBuilder});

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      animationDuration: const Duration(milliseconds: 300),
      onTap: onTap,
      likeCountAnimationType: LikeCountAnimationType.all,
      likeBuilder: likeBuilder,
      // likeBuilder: (bool isLiked) {
      //   return Icon(
      //     icon,
      //     likeStatus ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      //     color: likeStatus ? Colors.red : Colors.black,
      //   );
      // },
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.black,
        dotSecondaryColor: Colors.green,
        dotLastColor: Colors.red,
      ),
    );
  }
}

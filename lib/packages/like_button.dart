import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonExample extends StatefulWidget {
  const LikeButtonExample({Key? key}) : super(key: key);

  @override
  State<LikeButtonExample> createState() => _LikeButtonExampleState();
}

class _LikeButtonExampleState extends State<LikeButtonExample> {
  bool likeStatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LikeButton(
          animationDuration: const Duration(milliseconds: 400),
          onTap: (bool isLiked) {
            setState(() {
              likeStatus = !likeStatus;
            });
            return Future.value(!isLiked);
          },
          likeBuilder: (bool isLiked) {
            return Icon(
              likeStatus
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: likeStatus ? Colors.red : Colors.grey,
            );
          },
          bubblesColor: const BubblesColor(
            dotPrimaryColor: Colors.red,
            dotSecondaryColor: Colors.green,
          ),
        ),
      ),
    );
  }
}

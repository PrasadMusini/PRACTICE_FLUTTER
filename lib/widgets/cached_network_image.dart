import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWid extends StatelessWidget {
  const CachedNetworkImageWid({super.key});

  final imagePath =
      'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //MARK: Cached Network Image
            CachedNetworkImage(
              imageUrl: imagePath,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

            const SizedBox(
              height: 50,
            ),

            //MARK: Normal network Image
            Image.network(imagePath),
          ],
        ),
      ),
    );
  }
}

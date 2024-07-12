import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrFlutterPack extends StatelessWidget {
  const QrFlutterPack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                height: 200,
                child: QrImageView(
                  data: 'This QR code has an embedded image as well',
                  version: QrVersions.auto,
                  size: 320,
                  gapless: true,
                  // embeddedImage: const AssetImage('Assets.images.dragon.path'),
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(80, 80),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

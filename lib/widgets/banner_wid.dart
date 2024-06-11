import 'package:flutter/material.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Example'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Card',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ClipRRect(
              child: Banner(
                message: "  BEST SELLER  ",
                textStyle: const TextStyle(fontSize: 8),
                location: BannerLocation.topStart,
                color: Colors.red,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

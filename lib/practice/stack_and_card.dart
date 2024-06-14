import 'package:flutter/material.dart';
import 'package:practice_flutter/gen/assets.gen.dart';

class StackAndCard extends StatelessWidget {
  const StackAndCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            stackCardItemWid(),
            const SizedBox(height: 20),
            stackAlignWid(),
            const SizedBox(height: 20),
            colorBoxInkEffectButtonWid(),
            const SizedBox(height: 20),
            complexCardItem(),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }

  Container complexCardItem() {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                Assets.dragon.path,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text('Item Name'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('\$45'),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(20)),
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.grey.shade400,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Material colorBoxInkEffectButtonWid() {
    return Material(
      color: Colors.transparent, // Ensure the Material itself is transparent
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.blue, // Set the color of the Ink widget
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            print('Tapped');
          },
          splashColor: Colors.red, // Set the splash (ink) color to red
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Click here',
              style: TextStyle(
                  color: Colors.white), // Set text color to ensure visibility
            ),
          ),
        ),
      ),
    );
  }

  Widget stackCardItemWid() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: <Widget>[
          Positioned(
            width: 16,
            left: 30.0,
            child: Container(
              height: 80,
              color: Colors.blue,
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 40,
              height: 40,
              // padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.grey.shade400,
              ),
              child: const Icon(
                Icons.label_important_outlined,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget stackAlignWid() {
    return Container(
        width: 150,
        height: 150,
        color: Colors.grey,
        child: Align(
          // alignment: Alignment.center,
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
              ),
              child: const Align(child: Text('data'))),
        ));
  }
}

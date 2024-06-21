import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height - size.height * 0.2,
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.152,
        ), // vertical: size.height * 0.14
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I craft wonderful digital\nexperiences for brands',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            SizedBox(
                width: size.width,
                height: (size.height - size.height * 0.2) / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    brandBox(size),
                    brandBox(size),
                    brandBox(size),
                    brandBox(size),
                    brandBox(size),
                  ],
                )
                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: 5,
                //   itemBuilder: (context, index) {
                //     return brandBox(size);
                //   },
                // ),
                ),
          ],
        ),
      ),
    );
  }

  Widget brandBox(Size size) {
    return Column(
      children: [
        Container(
          width: size.width / 9.5,
          height: (size.height - size.height * 0.2) / 2.5,
          alignment: Alignment.center,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromARGB(115, 168, 160, 160),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
              ),
              SizedBox(height: 20),
              Text(
                '90%',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Figma',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],

      //  const SizedBox(
      //     width: 50,
      //   )
    );
  }
}

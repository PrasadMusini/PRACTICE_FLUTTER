// import 'package:flutter/material.dart';
// import 'package:practice_flutter/web/utilities/constants.dart';

// class Screen4 extends StatelessWidget {
//   const Screen4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SizedBox(
//       width: size.width,
//       height: size.height - size.height * 0.2,
//       child: Container(
//         color: Colors.black,
//         padding: EdgeInsets.symmetric(
//           horizontal: size.width * 0.152,
//         ), // vertical: size.height * 0.14
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'I craft wonderful digital\nexperiences for brands',
//               // style: TextStyle(
//               //     color: Colors.white,
//               //     fontSize: size.width * 0.035,
//               //     fontWeight: FontWeight.bold),

//               style: TextStyle(
//                   fontFamily: 'Sora',
//                   color: Colors.white,
//                   fontSize: size.width * 0.035,
//                   fontWeight: FontWeight.w900),
//             ),
//             const SizedBox(height: 30),
//             SizedBox(
//                 width: size.width,
//                 height: (size.height - size.height * 0.2) / 2,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     brandBox(size),
//                     brandBox(size),
//                     brandBox(size),
//                     brandBox(size),
//                     brandBox(size),
//                   ],
//                 )
//                 // ListView.builder(
//                 //   scrollDirection: Axis.horizontal,
//                 //   itemCount: 5,
//                 //   itemBuilder: (context, index) {
//                 //     return brandBox(size);
//                 //   },
//                 // ),
//                 ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget brandBox(Size size) {
//     return Column(
//       children: [
//         Container(
//           width: size.width / 9.9,
//           height: (size.height - size.height * 0.2) /
//               2, //  (size.height - size.height * 0.2) / 2.5
//           alignment: Alignment.center,
//           // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(45),
//             border: Border.all(
//               color: const Color.fromARGB(115, 168, 160, 160),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const CircleAvatar(
//                 backgroundColor: Colors.grey,
//                 radius: 50,
//               ),
//               const SizedBox(height: 20),
//               Text('90%',
//                   // style: TextStyle(
//                   //     color: Colors.white,
//                   //     fontSize: 50,
//                   //     fontWeight: FontWeight.bold),
//                   style:
//                       Constants.txW5FsCb.copyWith(fontSize: size.width * 0.024))
//             ],
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           'Figma',
//           style: Constants.txW8FpCw.copyWith(
//             fontSize: size.width * 0.012,
//           ),
//           // style: TextStyle(
//           //     color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//       ],

//       //  const SizedBox(
//       //     width: 50,
//       //   )
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_flutter/animations/effects/loading_numbers_animation.dart';
import 'package:practice_flutter/portfolio_web/utilities/constants.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height - size.height * 0.1, //0.2
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.152,
        ), // vertical: size.height * 0.14
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'I craft wonderful digital\nexperiences for brands',
              // style: TextStyle(
              //     color: Colors.white,
              //     fontSize: size.width * 0.035,
              //     fontWeight: FontWeight.bold),

              style: TextStyle(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w900),
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
          width: size.width / 9.5, //9.9
          height: (size.height - size.height * 0.2) / 2.5,
          alignment: Alignment.center,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
            color: const Color(0XFF0b0b0b),
            borderRadius: BorderRadius.circular(35),
            border: Border.all(
              color: const Color.fromARGB(115, 168, 160, 160),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.network(
                    'https://petrix-react.vercel.app/images/skill_icon_1.png'),
              ),
              const SizedBox(height: 20),

              LoadingNumbersAnimation(
                percentage: 99,
                delay: 5,
                style:
                    Constants.txW5FsCb.copyWith(fontSize: size.width * 0.024),
              ),
              // Text('99%',
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 50,
              //         fontWeight: FontWeight.bold),
              //     style: Constants.txW5FsCb
              //         .copyWith(fontSize: size.width * 0.024)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Figma',
          style: Constants.txW8FpCw.copyWith(
            fontSize: size.width * 0.012,
          ),
          // style: TextStyle(
          //     color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],

      //  const SizedBox(
      //     width: 50,
      //   )
    );
  }
}

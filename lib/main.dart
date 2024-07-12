import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_carousel.dart';
import 'package:practice_flutter/project/navigation/router_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );

    /*   return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Test(),
    ); */

    // return MaterialApp.router(
    //   routerDelegate: router.routerDelegate,
    //   routeInformationParser: router.routeInformationParser,
    //   routeInformationProvider: router.routeInformationProvider,
    // );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          // color: Colors.grey,
          // padding: const EdgeInsets.all(10),
          height: 200,
          child: CustomCarousel(
            height: 200,
          ),
        ),
      ),
    );
  }
}

// class CustomCarousel extends StatelessWidget {
//   static List<String> imgList = const [
//     'https://via.placeholder.com/600',
//     'https://via.placeholder.com/600/92c952',
//     'https://via.placeholder.com/600/771796',
//     'https://via.placeholder.com/600/d32776',
//     'https://via.placeholder.com/600/f66b97',
//     'https://via.placeholder.com/600/56a8c2',
//   ];

//   const CustomCarousel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FlutterCarousel(
//       options: CarouselOptions(
//         height: 200.0,
//         showIndicator: true,
//         autoPlay: true,
//         floatingIndicator: true,
//         autoPlayCurve: Curves.easeInOut,
//         padEnds: true,
//         indicatorMargin: 12,
//         enlargeCenterPage: true,
//         enlargeStrategy: CenterPageEnlargeStrategy.height,
//         slideIndicator: const CircularSlideIndicator(
//             // indicatorBorderColor: Colors.grey,
//             // currentIndicatorColor: Colors.red,
//             indicatorRadius: 4),
//       ),
//       items: imgList.map((item) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               margin: const EdgeInsets.only(right: 5),
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: CachedNetworkImage(
//                 imageUrl: item,
//                 fit: BoxFit.cover,
//                 progressIndicatorBuilder: (context, url, downloadProgress) =>
//                     Center(
//                         child: CircularProgressIndicator(
//                             value: downloadProgress.progress)),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//               /* Image.network(
//                 item,
//                 height: 100,
//                 fit: BoxFit.cover,
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;

//                   return const Center(
//                       child: CircularProgressIndicator.adaptive());
//                 },
//               ), */
//             );
//           },
//         );
//       }).toList(),
//     );
//   }
// }

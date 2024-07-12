import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/practice/carousel_example.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_btn.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_carousel.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/like_button.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/screens/item.dart';
import 'package:practice_flutter/project/navigation/router.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  // bool isIntialState = true;
  bool likeStatus = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(0.025.sw), // 12
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.006.sh),
                    header(),
                    SizedBox(height: 0.02.sh),
                    // searchBar(context),
                    SizedBox(height: 0.02.sh),
                    specialOffers(),
                    SizedBox(height: 0.02.sh),
                    mostOrdered(),
                    SizedBox(height: 0.02.sh),
                    menu(size),
                  ],
                ),
              ),
              tellUs(),
              SizedBox(height: 0.025.sh),
            ],
          ),
        ),
      ),
    );
  }

  //MARK: Tell us
  Row tellUs() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tell us what you are looking for!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                    'Lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dipiscing elit'),
                CustomBtn(
                  onPressed: () {
                    // GoRouter.of(context)
                    //     .pushReplacement('/new-screen');
                    // while (context.canPop()) {
                    //   context.pop();
                    // }

                    // while (GoRouter.of(context).canPop()) {
                    //   GoRouter.of(context).pop();
                    // }
                    // context.pushReplacement(Routes.testScreen.path);
                  },
                  backgroundColor: Colors.black,
                  radius: 12,
                  horizontalPadding: 20,
                  child: const Text('Tell us'),
                )
              ],
            ),
          ),
        ),
        const Expanded(
            flex: 2,
            child: Center(
              child: Icon(Icons.home),
            ))
      ],
    );
  }

  //MARK: Menu
  Column menu(Size size) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Menu Items',
            style: Styles.txStyF12FWbFFpCb.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
          Text(
            'See all',
            style: Styles.txStyF12FWbFFpCb.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Item(
            index: index,
            itemCount: 10,
          );
        },
      ),
    ]);
  }

  //MARK: Most Orders
  Column mostOrdered() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Most Ordered items',
              style: Styles.txStyF12FWbFFpCb.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
            Text(
              'See all',
              style: Styles.txStyF12FWbFFpCb.copyWith(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
        Container(
          // height: 180,
          height: ScreenUtil().screenHeight / 2.9,
          color: Colors.grey.shade200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 0.4255.sw,
                // padding: const EdgeInsets.symmetric(horizontal: 4),
                margin: const EdgeInsets.only(right: 20),
                // width: 0.43.sw,
                // width: 0.425.sw,
                // height: 0.19.sh,
                color: Colors.grey.shade400,
                child: DisplayItem(
                  likebtn: LikeBtn(
                    onTap: (bool isLiked) {
                      setState(() {
                        likeStatus = !likeStatus;
                      });
                      return Future.value(!isLiked);
                    },
                    likeBuilder: (isLiked) {
                      return Icon(
                        likeStatus
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: likeStatus ? Colors.red : Colors.black,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column displayItem() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 0.18.sh,
          clipBehavior: Clip.antiAlias,
          // padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  Assets.images.dragon.path,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 8,
                // child: Icon(Icons.favorite_border),
                child: LikeBtn(
                  onTap: (bool isLiked) {
                    setState(() {
                      likeStatus = !likeStatus;
                    });
                    return Future.value(!isLiked);
                  },
                  likeBuilder: (isLiked) {
                    return Icon(
                      likeStatus
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: likeStatus ? Colors.red : Colors.black,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Text(
          'Item Name',
          style: Styles.txStyF12FWbFFpCb
              .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        Text(
          'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Styles.txStyF12FWbFFpCb
              .copyWith(fontSize: 10.sp, fontWeight: FontWeight.normal),
        ),
        // Text(
        //   'description',
        //   style: Styles.txStyF12FWbFFpCb.copyWith(
        //       fontSize: 10.sp, fontWeight: FontWeight.normal),
        // ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star_border_purple500_outlined,
                  size: 14,
                ),
                Text(
                  '4.5',
                  style: Styles.txStyF12FWbFFpCb
                      .copyWith(fontSize: 10.sp, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Text(
              '10 - 15min',
              style: Styles.txStyF12FWbFFpCb
                  .copyWith(fontSize: 10.sp, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }

  //MARK: Special offers
  Column specialOffers() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Special Offers',
              style: Styles.txStyF12FWbFFpCb.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
            Text(
              'See all',
              style: Styles.txStyF12FWbFFpCb.copyWith(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
        Container(
            // width: double.infinity,
            // height: 140,
            // color: Colors.grey,
            alignment: AlignmentDirectional.bottomStart,
            child: const CustomCarousel(
              height: 140,
            )),
        // Container(
        //   width: double.infinity,
        //   height: 140,
        //   color: Colors.grey,
        //   alignment: AlignmentDirectional.bottomStart,
        //   child: Text(
        //     'Special deals',
        //     style: Styles.txStyF12FWbFFpCb.copyWith(
        //       fontWeight: FontWeight.normal,
        //       color: Colors.black,
        //       fontSize: 15.sp,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  //MARK: Search bar
  GestureDetector searchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(Routes.screenSearch.name);
      },
      child: Hero(
        tag: 'tag-search',
        child: Container(
          height: 50,
          // height: 0.06.sh,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade400,
            ),
          ),
          child: Row(
            children: [
              Text(
                'Search for ',
                style: Styles.txStyF12FWbFFpCb.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                  fontSize: 13,
                ),
              ),
              animatedSlideText(),
              const Spacer(),
              const Icon(Icons.search),
              const VerticalDivider(),
              const Icon(Icons.format_align_left_sharp),
            ],
          ),
        ),
      ),
    );
  }

  Expanded animatedSlideText() {
    return Expanded(
      child: AnimatedTextField(
        readOnly: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        animationType: Animationtype.slide,
        hintTexts: const [
          '"One"',
          '"Two"',
          '"Three"',
        ],
        // hintTextStyle: const TextStyle(color: Colors.black),
        hintTextStyle: Styles.txStyF12FWbFFpCb.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 13,
        ),
      ),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            /* ClipRRect(
              borderRadius: BorderRadius.circular(30),
              // radius: 20,  0.058.sw
              child: Image.asset(Assets.images.dragon.path,
                  width: 50, height: 50, fit: BoxFit.cover),
            ), */
            GestureDetector(
              onTap: () {
                context.push(context.namedLocation(Routes.screenStory.name));
                // Story
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black,
                      Colors.red,
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  // radius: 20,  0.058.sw
                  child: Image.asset(Assets.images.dragon.path,
                      width: 0.13.sw, height: 0.13.sw, fit: BoxFit.cover),
                ),
                // radius: 20,  0.058.sw
              ),
            ),

            // CircleAvatar(
            //   radius: 0.06.sw,
            //   // radius: 20,  0.058.sw
            //   child: Image.asset(Assets.images.dragon.path, fit: BoxFit.cover),
            // ),
            SizedBox(width: 0.02.sw),
            Text(
              'User Name',
              style: Styles.txStyF12FWbFFpCb.copyWith(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 0.058.sw,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.card_travel_outlined),
            ),
            const SizedBox(width: 20),
            CircleAvatar(
              radius: 0.058.sw,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.notifications_paused_sharp),
            ),
          ],
        ),
      ],
    );
  }
}

class DisplayItem extends StatelessWidget {
  final Widget likebtn;
  const DisplayItem({super.key, required this.likebtn});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 0.42.sw,
          height: 0.19.sh,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16)),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  Assets.images.dragon.path,
                  fit: BoxFit.cover,
                ),
              ),

              //MARK: Like
              Positioned(
                top: 8,
                right: 5,
                child: LikeBtn(
                  onTap: (bool isLiked) {
                    return Future.value(true);
                  },
                  likeBuilder: (isLiked) {
                    return const Icon(
                      Icons.favorite_rounded,
                      color: Color(0xffff3040),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 78, 119, 182),
            // width: size.width * 0.42,
            // height: size.width * 0.4,
            height: 0.19.sh,
            // padding: const EdgeInsets.symmetric(vertical: 5)
            //     .copyWith(left: 0.03.sw),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Name',
                  style: Styles.txStyF12FWbFFpCb
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$123.00',
                  style: Styles.txStyF12FWbFFpCb
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  // style: Styles.txStyF12FWbFFpCb.copyWith(
                  //   // fontSize: 10,
                  //   fontSize: 0.03.sw,
                  // ),
                  style: Styles.txStyF12FWbFFpCb.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                // const Text(
                //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                //   style: TextStyle(fontSize: 10),
                // ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border_purple500_outlined,
                          size: 14,
                        ),
                        Text(
                          '4.5',
                          style: Styles.txStyF12FWbFFpCb.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '10 - 15min',
                      style: Styles.txStyF12FWbFFpCb.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

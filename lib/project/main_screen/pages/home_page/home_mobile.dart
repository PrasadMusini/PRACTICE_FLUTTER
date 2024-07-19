import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_btn.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_carousel.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/like_button.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/screens/display_item.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/screens/item.dart';
import 'package:practice_flutter/project/main_screen/pages/story/story_provider.dart';
import 'package:practice_flutter/project/navigation/router.dart';
import 'package:practice_flutter/project/theme/them_provider.dart';
import 'package:practice_flutter/project/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  // bool isIntialState = true;

  List<bool> likeStatusList = List<bool>.filled(10, false);
  bool likeStatus = false;

  late ThemeProvider themeProvider;
  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    themeProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) => Column(
            children: [
              Padding(
                padding: EdgeInsets.all(0.025.sw), // 12
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.006.sh),
                    header(),
                    SizedBox(height: 0.02.sh),
                    searchBar(context),
                    SizedBox(height: 0.02.sh),
                    specialOffers(),
                    SizedBox(height: 0.02.sh),
                    mostOrdered(),
                    SizedBox(height: 0.02.sh),
                    menu(
                      size,
                    ),
                  ],
                ),
              ),
              tellUs(),
              SizedBox(height: 0.04.sh),
              catering(),
              SizedBox(height: 0.04.sh),
              footer(),
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
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tell us what you are looking for!',
                    style: Styles.txStyF20FW6FFsCb.copyWith(
                      fontSize: 22,
                      color: themeProvider.isDarkTheme
                          ? primaryLight
                          : primaryDark,
                    )),
                Text(
                  'Lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dipiscing elit',
                  style: Styles.txStyF12FW3FFsCb.copyWith(
                    color: themeProvider.isDarkTheme
                        ? selectedItemBgLight
                        : selectedItemBg1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBtn(
                      onPressed: () {},
                      verticalPadding: 10,
                      horizontalPadding: 20,
                      radius: 8,
                      backgroundColor: themeProvider.isDarkTheme
                          ? primaryLight
                          : primaryDark,
                      child: Text(
                        'Tell us',
                        style: Styles.txStyF12FW6FFsCb.copyWith(
                          color: themeProvider.isDarkTheme
                              ? primaryDark
                              : primaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Center(
              child: SizedBox(
                  height: 0.1.sh,
                  child: Image.asset(Assets.images.image1.path)),
            ))
      ],
    );
  }

  //MARK: Catering
  Row catering() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: SizedBox(
                height: 0.1.sh, child: Image.asset(Assets.images.image2.path)),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('For Caterers',
                    style: Styles.txStyF20FW6FFsCb.copyWith(
                      fontSize: 22,
                      color: themeProvider.isDarkTheme
                          ? primaryLight
                          : primaryDark,
                    )),
                Text(
                  'Lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dipiscing elit',
                  style: Styles.txStyF12FW3FFsCb.copyWith(
                    color:
                        themeProvider.isDarkTheme ? primaryLight : primaryDark,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBtn(
                      onPressed: () {},
                      verticalPadding: 10,
                      horizontalPadding: 20,
                      radius: 8,
                      backgroundColor: themeProvider.isDarkTheme
                          ? primaryLight
                          : primaryDark,
                      child: Text(
                        'Contact us',
                        style: Styles.txStyF12FW6FFsCb.copyWith(
                          color: themeProvider.isDarkTheme
                              ? primaryDark
                              : primaryLight,
                        ),
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
              color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              fontSize: 15.sp,
            ),
          ),
          Text(
            'See all',
            style: Styles.txStyF12FWbFFpCb.copyWith(
              fontWeight: FontWeight.normal,
              color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
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
            onTap: () {
              context.push(context.namedLocation(Routes.screenOrderItem.name));
            },
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
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                fontSize: 15.sp,
              ),
            ),
            Text(
              'See all',
              style: Styles.txStyF12FWbFFpCb.copyWith(
                fontWeight: FontWeight.normal,
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 0.32.sh,
          // height: ScreenUtil().screenHeight / 3.26,
          // color: Colors.grey.shade200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 0.4255.sw,
                margin: const EdgeInsets.only(right: 20),
                // color: Colors.grey.shade400,
                child: DisplayItem(
                  isLiked: likeStatusList[index],
                  navigateTo: () {
                    context.push(
                        context.namedLocation(Routes.screenOrderItem.name));
                  },
                  onTap: (bool isLiked) async {
                    setState(() {
                      likeStatusList[index] = !isLiked;
                    });
                    return !isLiked;
                  },
                ),
              );
            },
          ),
        ),
        // SizedBox(
        //   // color: Colors.grey,
        //   // height: 180,
        //   height: ScreenUtil().screenHeight / 3.26,
        //   // color: Colors.grey.shade200,
        //   child: ListView.builder(
        //     itemCount: 10,
        //     scrollDirection: Axis.horizontal,
        //     // physics: const NeverScrollableScrollPhysics(),
        //     // shrinkWrap: true,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         width: 0.4255.sw,
        //         // padding: const EdgeInsets.symmetric(horizontal: 4),
        //         margin: const EdgeInsets.only(right: 12),
        //         // width: 0.43.sw,
        //         // width: 0.425.sw,
        //         // height: 0.19.sh,
        //         // color: Colors.grey.shade400,
        //         child: Consumer<HomeProvider>(
        //           builder: (context, homeProvider, _) => DisplayItem(
        //             isLiked: homeProvider.getLikedStatus[index],
        //             onTap: (p0) {
        //               print('log: $p0');
        //               homeProvider.setLikedStatus = index;
        //               return Future.value(true);
        //             },
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
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
            height: 80, // 140
          ),
        ),
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
              color: themeProvider.isDarkTheme
                  ? selectedItemBgLight
                  : selectedItemBg1,
            ),
          ),
          child: Row(
            children: [
              Text(
                'Search for ',
                style: Styles.txStyF12FWbFFpCb.copyWith(
                  fontWeight: FontWeight.w500,
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                  fontSize: 13,
                ),
              ),

              AnimatedTextKit(animatedTexts: [
                RotateAnimatedText(
                  'Tiffins',
                  textStyle: Styles.txStyF12FWbFFpCb.copyWith(
                    fontWeight: FontWeight.w500,
                    color: themeProvider.isDarkTheme
                        ? secondaryLight
                        : secondaryDark,
                    fontSize: 13,
                  ),
                ),
                RotateAnimatedText(
                  '"Beverage"',
                  textStyle: Styles.txStyF12FWbFFpCb.copyWith(
                    fontWeight: FontWeight.w500,
                    color: themeProvider.isDarkTheme
                        ? secondaryLight
                        : secondaryDark,
                    fontSize: 13,
                  ),
                ),
                RotateAnimatedText(
                  '"Specials"',
                  textStyle: Styles.txStyF12FWbFFpCb.copyWith(
                    fontWeight: FontWeight.w500,
                    color: themeProvider.isDarkTheme
                        ? secondaryLight
                        : secondaryDark,
                    fontSize: 13,
                  ),
                ),
              ]),
              // animatedSlideText(),
              const Spacer(),
              Icon(
                Icons.search,
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
              VerticalDivider(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
              Icon(
                Icons.format_align_left_sharp,
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded animatedSlideText() {
    return Expanded(
      child: AnimatedTextField(
        onTap: () {
          context.goNamed(Routes.screenSearch.name);
        },
        readOnly: true,
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
            Consumer<StoryProvider>(
              builder: (context, provider, _) => GestureDetector(
                onTap: () {
                  if (provider.isStorySeen) {
                    context.push(context.namedLocation(Routes.screen404.name));
                    return;
                  }
                  context.push(context.namedLocation(Routes.screenStory.name));
                  // Story
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themeProvider.isDarkTheme
                        ? selectedItemBgLight
                        : selectedItemBg1,
                    gradient: provider.isStorySeen
                        ? null
                        : const LinearGradient(
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
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
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
            GestureDetector(
              onTap: () {
                print('Routes.screenNotifications.name');
                context.push(
                    context.namedLocation(Routes.screenNotifications.name));
              },
              child: CircleAvatar(
                radius: 0.058.sw,
                backgroundColor: themeProvider.isDarkTheme
                    ? selectedItemBgLight
                    : selectedItemBg1,
                child: Icon(
                  Icons.notifications_paused_sharp,
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool changeFooter = false;
  Widget footer() {
    return GestureDetector(
        onTap: () {
          setState(() {
            changeFooter = !changeFooter;
          });
        },
        child: footerContent());
  }

  Container footerContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      color: themeProvider.isDarkTheme ? selectedItemBg1 : selectedItemBg3,
      // color: const Color(0xff161b21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Terms',
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                ),
              ),
              Text(
                'xxxx',
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                ),
              ),
              Text(
                'xxxx',
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                ),
              ),
              Text(
                'xxxx',
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                ),
              ),
              Text(
                'xxxx',
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                ),
              ),
            ],
          ),
          const SizedBox(width: 5),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              'Policy',
              style: TextStyle(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
            Text(
              'xxxx',
              style: TextStyle(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
            Text(
              'xxxx',
              style: TextStyle(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
          ]),
          const SizedBox(width: 5),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              'Connect',
              style: TextStyle(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
            Text(
              'xxxx',
              style: TextStyle(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
          ]),
          const SizedBox(width: 5),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              'Services',
              style: TextStyle(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
            Text(
              'xxxx',
              style: TextStyle(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
            Text(
              'xxxx',
              style: TextStyle(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
            Text(
              'xxxx',
              style: TextStyle(
                color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
              ),
            ),
          ]),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Manage by',
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                ),
              ),
              Text(
                'xxxx',
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

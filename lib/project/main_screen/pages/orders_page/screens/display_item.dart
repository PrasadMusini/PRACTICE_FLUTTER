import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';
import 'package:practice_flutter/project/theme/them_provider.dart';
import 'package:practice_flutter/project/theme/theme_colors.dart';
import 'package:provider/provider.dart';
/* 
class DisplayItem extends StatelessWidget {
  const DisplayItem({super.key, required this.isLiked, required this.onTap});

  // bool likeStatus = false;
  final bool isLiked;
  final Future<bool?> Function(bool)? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 0.425.sw,
          height: 0.19.sh,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              // color: Colors.grey.shade300,
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
                child: 
                LikeBtn(
                  onTap: onTap,
                  likeBuilder: (isLiked) {
                    return Icon(
                      isLiked
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isLiked ? const Color(0xffff3040) : Colors.black,
                    );
                  },
                ),
                /*  LikeBtn(
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
                      color:
                          likeStatus ? const Color(0xffff3040) : Colors.black,
                    );
                  },
                ), */
              ),
            ],
          ),
        ),
        Container(
          // color: const Color.fromARGB(255, 78, 119, 182),
          // width: size.width * 0.42,
          // height: size.width * 0.4,
          // height: 0.1.sh,
          // padding: const EdgeInsets.symmetric(vertical: 5)
          //     .copyWith(left: 0.03.sw),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Item Name',
                style: Styles.txStyF12FWbFFpCb
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text(
                'salad',
                style: Styles.txStyF12FWbFFpCb.copyWith(
                    color: Colors.grey.shade500,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500),
              ),
              // const SizedBox(
              //   height: 4,
              // ),
              Text(
                'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
                maxLines: 2,
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
              // const Spacer(),
              const SizedBox(
                height: 8,
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
      ],
    );
  }
}
 */

class DisplayItem extends StatelessWidget {
  const DisplayItem({
    super.key,
    required this.isLiked,
    required this.onTap,
    this.navigateTo,
  });

  final bool isLiked;
  final Future<bool?> Function(bool)? onTap;
  final void Function()? navigateTo;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: navigateTo,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 0.425.sw,
            // height: 0.2.sh,
            height: 0.18.sh,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?cs=srgb&dl=pexels-ash-122861-376464.jpg&fm=jpg',
                    fit: BoxFit.cover,
                  ),

                  // Image.asset(
                  //   Assets.images.dragon.path,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                // Like button
                Positioned(
                  top: 8,
                  right: 5,
                  child: LikeButton(
                    size: 30,
                    isLiked: isLiked,
                    // circleColor: CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color.fromARGB(255, 0, 154, 54),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.black,
                      );
                    },
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          ),

          //MARK: content box
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // const SizedBox(
                //   height: 5,
                // ),
                Text(
                  'Item Name',
                  style: Styles.txStyF20FW6FFsCb.copyWith(
                    color:
                        themeProvider.isDarkTheme ? primaryLight : primaryDark,
                  ),
                ),
                Text(
                  'salad',
                  style: Styles.txStyF12FW5FFsCb.copyWith(
                    fontSize: 10.sp,
                    color: themeProvider.isDarkTheme
                        ? selectedItemBgLight
                        : selectedItemBg1,
                  ),
                ),
                Text(
                  'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  // style: Styles.txStyF12FW3FFsCb,
                  style: Styles.txStyF12FW3FFsCb.copyWith(
                    fontSize: 12,
                    color: themeProvider.isDarkTheme
                        ? secondaryLight
                        : secondaryDark,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_border_purple500_outlined,
                          size: 14.sp,
                        ),
                        Text(
                          '4.5  ',
                          style: Styles.txStyF14FW6FFsCb.copyWith(
                            color: themeProvider.isDarkTheme
                                ? primaryLight
                                : primaryDark,
                          ),
                        ),
                      ],
                    ),
                    const Text('•'),
                    Text(
                      '  10 - 15min',
                      style: Styles.txStyF14FW6FFsCb.copyWith(
                        color: themeProvider.isDarkTheme
                            ? primaryLight
                            : primaryDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

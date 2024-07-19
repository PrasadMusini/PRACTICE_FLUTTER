import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:practice_flutter/project/common_utilities/common_widgets.dart/add_to_card.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/like_button.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';
import 'package:practice_flutter/project/theme/them_provider.dart';
import 'package:practice_flutter/project/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class Item extends StatefulWidget {
  final int index;
  final int itemCount;
  final void Function()? onTap;
  const Item({
    super.key,
    required this.index,
    required this.itemCount,
    this.onTap,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isIntialState = true;
  bool likeStatus = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          border: (widget.itemCount - 1) == widget.index
              ? null
              : Border(
                  bottom: BorderSide(
                    color: themeProvider.isDarkTheme
                        ? selectedItemBgLight
                        : selectedItemBg2,
                    width: 0.5,
                  ),
                ),
        ),
        child: Row(
          children: [
            Container(
              height: 0.23.sh,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 0.425.sw,
                    height: 0.2.sh,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            'https://img.freepik.com/free-photo/chicken-wings-barbecue-sweetly-sour-sauce-picnic-summer-menu-tasty-food-top-view-flat-lay_2829-6471.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1720915200&semt=sph',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 5,
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
                                color: likeStatus
                                    ? const Color(0xffff3040)
                                    : Colors.black,
                              );
                            },
                          ),
                        ),
                        const Positioned(
                          bottom: 16,
                          left: 5,
                          child: Text(
                            '10% OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 6.sp,
                    left: isIntialState
                        ? 0.425.sw / 2.5
                        : 0.425.sw /
                            4.2, // intial position 2.4 | expand position 3.7
                    child: AddToCardBtn(
                      counterCallback: (count) {
                        if (count > 0) {
                          isIntialState = false;
                        } else {
                          isIntialState = true;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
// if item image is not available
            /* Container(
              width: 0.425.sw,
              height: 0.12.sh,
              color: Colors.grey.shade300,
            ), */
            //MARK: content box
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 0.03.sw),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Item Name',
                      style: Styles.txStyF20FW6FFsCb.copyWith(
                        color: themeProvider.isDarkTheme
                            ? primaryLight
                            : primaryDark,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border_purple500_outlined,
                          size: 14,
                        ),
                        Text(
                          '4.5  ',
                          style: Styles.txStyF14FW6FFsCb.copyWith(
                            color: themeProvider.isDarkTheme
                                ? primaryLight
                                : primaryDark,
                          ),
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
                    Text(
                      'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.txStyF12FW3FFsCb.copyWith(
                        color: themeProvider.isDarkTheme
                            ? primaryLight
                            : primaryDark,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          '10% OFF  -',
                          style: Styles.txStyF12FW5FFsCb.copyWith(
                            color: themeProvider.isDarkTheme
                                ? primaryLight
                                : primaryDark,
                          ),
                        ),
                        Text(
                          '  upto ₹50',
                          style: Styles.txStyF20FW6FFsCb.copyWith(
                            fontWeight: FontWeight.w500,
                            color: themeProvider.isDarkTheme
                                ? primaryLight
                                : primaryDark,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container addToCartButton() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddToCardBtn(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/add_to_card.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/like_button.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';

class Item extends StatefulWidget {
  final int index;
  final int itemCount;
  const Item({
    super.key,
    required this.index,
    required this.itemCount,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isIntialState = true;
  bool likeStatus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.width * 0.5,
      height: 0.55.sw,
      decoration: BoxDecoration(
        // color: Colors.grey,
        // border: Border.all(color: Colors.red),
        border: (widget.itemCount - 1) == widget.index
            ? null
            : Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.3),
                  width: 0.5,
                ),
              ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              // padding: const EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(vertical: 0.02.sh),

              child: Row(
                children: [
                  Container(
                    // width: size.width * 0.42,
                    width: 0.425.sw,
                    // height: size.width * 0.4,

                    height: 0.19.sh,
                    clipBehavior: Clip.antiAlias,
                    // padding: const EdgeInsets.symmetric(horizontal: 5),
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
                        Positioned(
                          top: 10,
                          right: 8,
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
                          /* LikeButton(
                            animationDuration:
                                const Duration(milliseconds: 300),
                            onTap: (bool isLiked) {
                              setState(() {
                                likeStatus = !likeStatus;
                              });
                              return Future.value(!isLiked);
                            },
                            likeCountAnimationType: LikeCountAnimationType.all,
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                likeStatus
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: likeStatus ? Colors.red : Colors.black,
                              );
                            },
                            bubblesColor: const BubblesColor(
                              dotPrimaryColor: Colors.black,
                              dotSecondaryColor: Colors.green,
                              dotLastColor: Colors.red,
                            ),
                          ), */

                          // Icon(
                          //   Icons.favorite_border,
                          // ),

                          // Icon(
                          //   Icons.favorite_rounded,
                          //   color: Colors.red,
                          // ),
                        ),
                        /* Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  // topRight: Radius.circular(8),
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                              )),
                        ), */
                      ],
                    ),
                  ),
                  // Expanded(
                  //   flex: 3,
                  //   child: Container(
                  //     color: Colors.grey.shade600,
                  //   ),
                  // ),

                  Expanded(
                    child: Container(
                      // width: size.width * 0.42,
                      // height: size.width * 0.4,
                      padding: const EdgeInsets.symmetric(vertical: 5)
                          .copyWith(left: 0.03.sw),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Item Name',
                            style: Styles.txStyF12FWbFFpCb.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '\$123.00',
                            style: Styles.txStyF12FWbFFpCb.copyWith(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            // style: Styles.txStyF12FWbFFpCb.copyWith(
                            //   // fontSize: 10,
                            //   fontSize: 0.03.sw,
                            // ),
                            style: Styles.txStyF12FWbFFpCb.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 11.sp,
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
                  )
                ],
              ),
            ),
          ),
          //MARK: Add to cart
          Positioned(
            bottom: 10,
            left: isIntialState
                ? 0.425.sw / 2.5
                : 0.425.sw / 4.2, // intial position 2.4 | expand position 3.7
            child: AddToCardBtn(
              counterCallback: (count) {
                print('count: $count');
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

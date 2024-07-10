import 'package:flutter/material.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/project/navigation/router.dart';

class Item extends StatelessWidget {
  final int index;
  const Item({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: size.width * 0.045),
      margin: EdgeInsets.only(bottom: size.width * 0.01),
      decoration: BoxDecoration(
          // color: Colors.grey.shade500,
          border: Border(
        bottom: BorderSide(
          color: Colors.grey.withOpacity(0.3),
          width: 0.5,
        ),
      )),
      child: GestureDetector(
        onTap: () {
          // context.pushNamed(Routes.screenOrderItem.name);
          context.push(context.namedLocation(Routes.screenOrderItem.name));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Hero(
                tag: 'menu-item-$index',
                child: Container(
                  width: size.width * 0.42,
                  height: size.width * 0.4,
                  clipBehavior: Clip.antiAlias,
                  // padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(18)),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          Assets.images.dragon.path,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        top: 8,
                        right: 6,
                        child: Icon(
                          Icons.favorite_border,
                        ),
                        // Icon(
                        //   Icons.favorite_rounded,
                        //   color: Colors.red,
                        // ),
                      ),
                      Positioned(
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
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: size.width * 0.42,
                  height: size.width * 0.4,
                  padding: const EdgeInsets.symmetric(vertical: 5)
                      .copyWith(left: size.width * 0.03),
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
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      // Row(
                      //   children: [
                      //     const Icon(
                      //       Icons.star_border_purple500_outlined,
                      //       size: 14,
                      //     ),
                      //     Text(
                      //       '4.2',
                      //       style: Styles.txStyF12FWbFFpCb.copyWith(
                      //           fontSize: 12, fontWeight: FontWeight.w500),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.txStyF12FWbFFpCb.copyWith(
                          fontSize: 10,
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
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            '10 - 15min',
                            style: Styles.txStyF12FWbFFpCb.copyWith(
                                fontSize: 10, fontWeight: FontWeight.w500),
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
    );
  }
}

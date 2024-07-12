import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/gen/fonts.gen.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_btn.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';

class StatusItem extends StatelessWidget {
  final int index;
  final int itemCount;
  final String orderStatus;
  final Widget? likeButton;

  const StatusItem({
    super.key,
    required this.index,
    required this.itemCount,
    required this.orderStatus,
    this.likeButton,
  });

  // bool isIntialState = true;
  // bool likeStatus = false;

  Row cancelBtn() {
    return Row(
      children: [
        Expanded(
          child: CustomBtn(
            onPressed: () {},
            verticalPadding: 15,
            // horizontalPadding: 30,
            borderColor: Colors.grey.shade700,
            radius: 8,
            backgroundColor: Colors.white,
            child: const Text(
              'Cancel',
              style: Styles.txStyF12FWbFFpCb,
            ),
          ),
        ),
      ],
    );
  }

  Row completeBtn() {
    return Row(
      children: [
        Expanded(
          child: CustomBtn(
            onPressed: () {},
            verticalPadding: 15,
            // horizontalPadding: 30,
            borderColor: Colors.grey.shade700,
            radius: 8,
            backgroundColor: Colors.white,
            child: const Text(
              'Feedback',
              style: Styles.txStyF12FWbFFpCb,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomBtn(
            onPressed: () {},
            verticalPadding: 15,
            // horizontalPadding: 30,
            radius: 8,
            backgroundColor: Colors.black,
            child: const Text(
              'Re-Order',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.poppins,
                color: Colors.white,
              ),
            ),
          ),

          /*  CustomBtn(
            onPressed: () {},
            verticalPadding: 15,
            horizontalPadding: 30,
            radius: 8,
            backgroundColor: Colors.black,
            child: const Text('Re-Order',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.poppins,
                  color: Colors.white,
                )),
          ), */
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*  
        Container(
          // height: size.width * 0.5,
          height: 0.48.sw,
          // height: 0.5.sw,
          // padding: EdgeInsets.only(top: 0.02.sh),
          decoration: BoxDecoration(
            // color: Colors.grey.shade400,

            border: (itemCount - 1) == index
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
                  padding: EdgeInsets.only(top: 0.02.sh),

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
                            if (likeButton != null)
                              Positioned(
                                top: 10,
                                right: 8,
                                child: likeButton!,
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12)
                              .copyWith(left: 0.03.sw),
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'StatusItem Name',
                                style: Styles.txStyF12FWbFFpCb.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '\$123.00',
                                style: Styles.txStyF12FWbFFpCb.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.txStyF12FWbFFpCb.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
            ],
          ),
        ),
         */
        Container(
          height: 0.22.sh,
          // padding: EdgeInsets.symmetric(vertical: 0.02.sh),
          decoration: const BoxDecoration(
              // color: Colors.grey,
              // border: (widget.itemCount - 1) == widget.index
              //     ? null
              //     : Border(
              //         bottom: BorderSide(
              //           color: Colors.grey.withOpacity(0.3),
              //           width: 0.5,
              //         ),
              //       ),
              // border: Border.all(color: Colors.red),
              ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Row(
                  children: [
                    Container(
                      width: 0.42.sw,
                      height: 0.19.sh,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.asset(
                        Assets.images.dragon.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 78, 119, 182),
                        child: Expanded(
                          child: Container(
                            // width: size.width * 0.42,
                            // height: size.width * 0.4,
                            height: 0.19.sh,
                            padding: const EdgeInsets.symmetric(vertical: 5)
                                .copyWith(left: 0.03.sw),
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Item Name',
                                  style: Styles.txStyF12FWbFFpCb.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '\$123.00',
                                  style: Styles.txStyF12FWbFFpCb.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_border_purple500_outlined,
                                          size: 14,
                                        ),
                                        Text(
                                          '4.5',
                                          style:
                                              Styles.txStyF12FWbFFpCb.copyWith(
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
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        if (orderStatus.toLowerCase() == 'active') ...[
          cancelBtn(),
        ] else ...[
          completeBtn(),
        ],
        const SizedBox(height: 15),
        if ((itemCount - 1) == index)
          const SizedBox()
        else
          Divider(
            color: Colors.grey.withOpacity(0.3),
            height: 0.5,
          ),
      ],
    );
  }
}

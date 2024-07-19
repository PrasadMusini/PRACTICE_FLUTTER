import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/add_to_card.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_btn.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';

class OrderItemMobile extends StatefulWidget {
  // final int index;
  const OrderItemMobile({super.key});

  @override
  State<OrderItemMobile> createState() => _OrderItemMobileState();
}

class _OrderItemMobileState extends State<OrderItemMobile> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SafeArea(
        child: Stack(
          children: [
            itemImage(size),
            backBtn(),
            favorateIcon(),
            contentSheet(size),
            bottomButton(),
          ],
        ),
      ),
    );
  }

  Positioned backBtn() {
    return Positioned(
      top: 15,
      left: 15,
      child: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: const CircleAvatar(
          radius: 22,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Positioned bottomButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  '\$149.99',
                  style: Styles.txStyF12FWbFFpCb,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomBtn(
                      onPressed: () {},
                      verticalPadding: 13,
                      backgroundColor: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Text('Add to Card',
                              style: Styles.txStyF12FWbFFpCb
                                  .copyWith(color: Colors.white)),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned contentSheet(Size size) {
    return Positioned(
      top: size.height * 0.28,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: size.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Item Name',
                          style: Styles.txStyF12FWbFFpCb,
                        ),
                        addToCartButton(),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$149.99',
                          style: Styles.txStyF12FWbFFpCb,
                        ),
                        Text(
                          ' (single)',
                          style: Styles.txStyF12FWbFFpCb,
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star_rate_rounded, size: 17),
                        Text(
                          '4.2',
                          style: Styles.txStyF12FWbFFpCb,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    AnimatedReadMoreText(
                      'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
                      maxLines: 3,
                      textStyle: Styles.txStyF12FWbFFpCb,
                      buttonTextStyle: Styles.txStyF12FWbFFpCb.copyWith(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(height: 300, color: Colors.grey),
              Container(
                  height: 60, color: const Color.fromARGB(255, 214, 36, 36)),
            ],
          ),
        ),
      ),
    );
  }

  Positioned favorateIcon() {
    return const Positioned(
      top: 15,
      right: 15,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.favorite_border_rounded,
          size: 20,
          color: Colors.white,
        ),
      ),
      // Icon(Icons.favorite_border_rounded),
    );
  }

  Positioned itemImage(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height * 0.3,
        color: Colors.green.shade300,
        alignment: Alignment.center,
        child: Image.asset(
          Assets.images.dragon.path,
          fit: BoxFit.cover,
          height: size.height * 0.3,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_btn.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/screens/active_orders.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/screens/completed_orders.dart';

class OrdersMobile extends StatefulWidget {
  const OrdersMobile({super.key});

  @override
  State<OrdersMobile> createState() => _OrdersMobileState();
}

class _OrdersMobileState extends State<OrdersMobile> {
  int _selectedSegment = 0;
  List<Widget> orderScreens = const [ActiveOrders(), CompletedOrders()];

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CupertinoSlidingSegmentedControl<int>(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    groupValue: _selectedSegment,
                    children: const {
                      0: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Active Orders',
                          style: Styles.txStyF12FWbFFpCb,
                        ),
                      ),
                      1: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Completed Orders',
                          style: Styles.txStyF12FWbFFpCb,
                        ),
                      ),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        _selectedSegment = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            Expanded(child: orderScreens[_selectedSegment]),
            /* 
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          bottom: size.height * 0.02),
                      // margin: EdgeInsets.only(bottom: size.width * 0.01),
                      decoration: const BoxDecoration(
                          // color: Colors.grey.shade500,
                          //     border: Border(
                          //   bottom: BorderSide(
                          //     color: Colors.grey.withOpacity(0.3),
                          //     width: 0.5,
                          //   ),
                          // ),
                          ),
                      child: GestureDetector(
                        onTap: () {
                          // context.pushNamed(Routes.screenOrderItem.name);
                          context.push(context
                              .namedLocation(Routes.screenOrderItem.name));
                        },
                        child: Row(
                          children: [
                            Hero(
                              tag: 'x-item-$index',
                              child: Container(
                                width: size.width * 0.42,
                                height: size.height * 0.44,
                                clipBehavior: Clip.antiAlias,
                                // padding: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
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
                                height: size.height * 0.44,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5)
                                        .copyWith(left: size.width * 0.03),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons
                                                  .star_border_purple500_outlined,
                                              size: 14,
                                            ),
                                            Text(
                                              '4.5',
                                              style: Styles.txStyF12FWbFFpCb
                                                  .copyWith(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '10 - 15min',
                                          style: Styles.txStyF12FWbFFpCb
                                              .copyWith(
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.w500),
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
                    cancelBtn(),
                    // SizedBox(height: size.width * 0.045),
                    if (10 == 10) const Divider(),
                  ],
                );
              },
            ),
           */
          ],
        ),
      ),
    );
  }

  Container cancelBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: CustomBtn(
              onPressed: () {},
              verticalPadding: 20,
              horizontalPadding: 30,
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
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 20,
              color: Colors.white,
            ),
          ),
          Text(
            'Orders',
            style: Styles.txStyF12FWbFFpCb.copyWith(
              fontSize: 24,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

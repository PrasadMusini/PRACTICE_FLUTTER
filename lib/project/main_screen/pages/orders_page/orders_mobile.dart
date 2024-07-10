import 'package:flutter/material.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';

class OrdersMobile extends StatefulWidget {
  const OrdersMobile({super.key});

  @override
  State<OrdersMobile> createState() => _OrdersMobileState();
}

class _OrdersMobileState extends State<OrdersMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Actice Orders',
                      style: Styles.txStyF12FWbFFpCb
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Orders',
                      style: Styles.txStyF12FWbFFpCb
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        ));
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

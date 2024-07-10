import 'package:flutter/material.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';

class OrdersMobile extends StatefulWidget {
  const OrdersMobile({super.key});

  @override
  State<OrdersMobile> createState() => _OrdersMobileState();
}

class _OrdersMobileState extends State<OrdersMobile> {
  int _quantity = 1;

  Widget addToCartButton() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              _quantity > 1 ? () => setState(() => _quantity--) : null;
            },
            child: Icon(
              Icons.remove,
              size: 20,
              color: _quantity > 1 ? Colors.black : Colors.grey.shade500,
            ),
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.remove,
          //     size: 20,
          //     color: _quantity > 1 ? Colors.black : Colors.grey.shade500,
          //   ),
          //   onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
          // ),
          Text('$_quantity', style: const TextStyle(fontSize: 14)),

          GestureDetector(
            onTap: () {
              setState(() => _quantity++);
            },
            child: const Icon(
              Icons.add,
              size: 20,
              color: Colors.black,
            ),
          ),

          // IconButton(
          //   icon: const Icon(
          //     Icons.add,
          //     size: 20,
          //     color: Colors.black,
          //   ),
          //   onPressed: () => setState(() => _quantity++),
          // ),
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
            Positioned(
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
            ),
            Positioned(
              top: size.height * 0.28,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: size.height * 0.3,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Text(
                      'Description',
                      style: Styles.txStyF12FWbFFpCb,
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
}

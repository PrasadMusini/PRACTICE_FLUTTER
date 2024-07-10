import 'package:add_to_cart_button/add_to_cart_button.dart';
import 'package:flutter/material.dart';

class AddToCardBtn extends StatelessWidget {
  final double borderRadius;
  final int initNumber;
  final int minNumber;
  final int maxNumber;
  final void Function()? increaseCallback;
  final void Function()? decreaseCallback;
  final void Function(int count)? counterCallback;
  final Color backgroundColor;
  final Color buttonFillColor;
  final Color buttonIconColor;

  const AddToCardBtn({
    super.key,
    this.borderRadius = 20,
    this.initNumber = 0,
    this.minNumber = 0,
    this.maxNumber = 10,
    this.increaseCallback,
    this.decreaseCallback,
    this.counterCallback,
    this.backgroundColor = Colors.white,
    this.buttonFillColor = Colors.white,
    this.buttonIconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: AddToCartCounterButton(
        initNumber: initNumber,
        minNumber: minNumber,
        maxNumber: maxNumber,
        increaseCallback: increaseCallback ?? (() {}),
        decreaseCallback: decreaseCallback ?? (() {}),
        counterCallback: counterCallback ?? ((int count) {}),
        backgroundColor: backgroundColor,
        buttonFillColor: buttonFillColor,
        buttonIconColor: buttonIconColor,
      ),
    );
  }
}

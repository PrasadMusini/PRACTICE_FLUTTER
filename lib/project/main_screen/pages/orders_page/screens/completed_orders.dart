import 'package:flutter/material.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Completed Orders',
          style: Styles.txStyF12FWbFFsCb.copyWith(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
